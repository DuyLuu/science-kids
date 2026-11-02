import Auth
import Foundation
import os
import PostgREST

/// `SyncTransport` on Supabase (B10, B7.7): a guest session from `signInAnonymously()` kept in the
/// Keychain (so it outlives a reinstall), and the three RPCs called through PostgREST with the
/// session's access token. Only the URL and the publishable key are in the app.
///
/// No retries here (`retryEnabled: false`): `SyncEngine` owns retrying, with backoff.
/// Nothing that names the project (URL, key, tokens) is ever logged.
public final class SupabaseTransport: SyncTransport {
    /// Keychain service of the session (the app's own name, not the library default).
    public static let keychainService = "vn.sciencekids.auth"

    private let auth: AuthClient
    private let rest: PostgrestClient
    private let log = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "sync")

    public init(config: SyncConfig) {
        let apiKey = ["apikey": config.publishableKey]
        let auth = AuthClient(
            url: config.url.appendingPathComponent("auth/v1"),
            headers: apiKey,
            localStorage: KeychainLocalStorage(service: Self.keychainService),
            logger: nil,
            fetch: { try await SupabaseTransport.send($0) }
        )
        self.auth = auth
        rest = PostgrestClient(
            url: config.url.appendingPathComponent("rest/v1"),
            headers: apiKey,
            logger: nil,
            fetch: { request in
                var request = request
                let session = try await auth.session
                request.setValue("Bearer \(session.accessToken)", forHTTPHeaderField: "Authorization")
                request.timeoutInterval = 20
                return try await Self.send(request)
            },
            encoder: JSONEncoder(),
            decoder: JSONDecoder(),
            retryEnabled: false
        )
    }

    /// Each request on its own ephemeral session, then one more try (0.5 s later) if the connection
    /// dropped under it (`networkConnectionLost`). Why:
    /// - with the shared session, the server's `Alt-Svc` answer is remembered on disk and later
    ///   launches go straight to HTTP/3; on the simulator that QUIC path drops in the middle of the
    ///   request (`-1005`, "path … unavailable") every time. A fresh ephemeral session starts on
    ///   HTTP/2 over TCP;
    /// - an ephemeral session also keeps no cache or cookie of these answers (child data) on disk.
    /// The three RPCs are safe to send again: `create_child_profile` with `p_id` and
    /// `submit_attempts` are idempotent, `get_home` reads. Other errors go to the queue's backoff.
    static func send(_ request: URLRequest) async throws -> (Data, URLResponse) {
        var retries = 1
        while true {
            let session = URLSession(configuration: .ephemeral)
            defer { session.finishTasksAndInvalidate() }
            do {
                return try await session.data(for: request)
            } catch let error as URLError where error.code == .networkConnectionLost && retries > 0 {
                retries -= 1
                try await Task.sleep(for: .milliseconds(500))
            }
        }
    }

    public func signIn() async throws -> String {
        if auth.currentSession != nil {
            do {
                return try await auth.session.user.id.uuidString.lowercased()
            } catch let error as AuthError {
                guard Self.sessionIsGone(error) else { throw SyncError.auth(Self.describe(error)) }
                // The server no longer knows this session (user removed on staging): start a new guest.
                log.error("stored session refused, signing in as a new guest: \(Self.describe(error), privacy: .public)")
                try? await auth.signOut(scope: .local)
            } catch {
                throw Self.classify(error)
            }
        }
        do {
            let session = try await auth.signInAnonymously()
            log.notice("signed in as a new guest")
            return session.user.id.uuidString.lowercased()
        } catch {
            throw Self.classify(error)
        }
    }

    public func createChildProfile(_ profile: ProfilePayload) async throws -> RPCResponse<ServerProfile> {
        try await call("create_child_profile", profile)
    }

    public func activeProfiles() async throws -> [ServerProfile] {
        do {
            return try await rest.from("child_profiles")
                .select("id,voice_mode,timezone")
                .is("archived_at", value: nil)
                .order("created_at")
                .execute()
                .value
        } catch {
            throw Self.classify(error)
        }
    }

    public func submitAttempts(_ attempts: [AttemptPayload]) async throws -> RPCResponse<SubmitResult> {
        try await call("submit_attempts", SubmitParams(attempts: attempts))
    }

    public func getHome(childId: UUID) async throws -> RPCResponse<HomeData> {
        try await call("get_home", HomeParams(childId: childId))
    }

    private struct SubmitParams: Encodable {
        let attempts: [AttemptPayload]
        enum CodingKeys: String, CodingKey { case attempts = "p_attempts" }
    }

    private struct HomeParams: Encodable {
        let childId: UUID
        enum CodingKeys: String, CodingKey { case childId = "p_child_id" }
    }

    private func call<Payload: Decodable & Sendable>(_ function: String, _ params: some Encodable & Sendable) async throws -> RPCResponse<Payload> {
        do {
            return try await rest.rpc(function, params: params).execute().value
        } catch {
            throw Self.classify(error)
        }
    }

    // MARK: Errors

    /// Network trouble → `offline`; an HTTP error from PostgREST (missing function, 5xx) → `server`;
    /// an Auth error → `auth`. Messages never carry the URL.
    static func classify(_ error: any Error) -> SyncError {
        if let error = error as? SyncError { return error }
        if let error = error as? URLError { return .offline("URLError \(error.code.rawValue)") }
        if let error = error as? PostgrestError { return .server("\(error.code ?? "-") \(error.message)") }
        if let error = error as? AuthError {
            if case .api(_, _, _, let response) = error, response.statusCode >= 500 { return .server("auth HTTP \(response.statusCode)") }
            return .auth(describe(error))
        }
        if let error = error as? HTTPError { return .server("HTTP \(error.response.statusCode)") }
        let nsError = error as NSError
        if nsError.domain == NSURLErrorDomain { return .offline("NSURLError \(nsError.code)") }
        return .server(String(describing: type(of: error)))
    }

    /// The refresh token or user is unknown to the server (4xx): the stored guest session is dead.
    static func sessionIsGone(_ error: AuthError) -> Bool {
        if case .sessionMissing = error { return true }
        if case .api(_, _, _, let response) = error { return (400..<500).contains(response.statusCode) }
        return false
    }

    static func describe(_ error: AuthError) -> String {
        switch error {
        case .api(_, let code, _, let response): "HTTP \(response.statusCode) \(code.rawValue)"
        case .sessionMissing: "session missing"
        default: String(describing: type(of: error))
        }
    }
}
