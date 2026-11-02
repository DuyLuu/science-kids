import Foundation

/// The server as `SyncEngine` sees it. `SupabaseTransport` talks to Supabase; tests use a fake.
///
/// A thrown error means the call did not get through (no network, server down, session not
/// refreshable): the engine keeps its queue and tries later with backoff. A call that got through
/// returns the RPC's own `{success, error_code, …}`.
public protocol SyncTransport: Sendable {
    /// The signed-in user's id: the session kept in the Keychain (refreshed when needed), or a new
    /// anonymous user (`signInAnonymously`) the first time.
    func signIn() async throws -> String
    func createChildProfile(_ profile: ProfilePayload) async throws -> RPCResponse<ServerProfile>
    /// The account's active profiles (`SELECT` on `child_profiles`; RLS returns only its own).
    func activeProfiles() async throws -> [ServerProfile]
    func submitAttempts(_ attempts: [AttemptPayload]) async throws -> RPCResponse<SubmitResult>
    func getHome(childId: UUID) async throws -> RPCResponse<HomeData>
}

public enum SyncError: Error, Hashable, Sendable, CustomStringConvertible {
    /// No URL or key in the build (`Config/Local.xcconfig` missing): sync is off.
    case notConfigured
    /// The request did not reach the server (offline, timeout, DNS).
    case offline(String)
    /// The server answered with an HTTP error (the function is missing, a 5xx…).
    case server(String)
    /// The session could not be made or refreshed.
    case auth(String)

    public var description: String {
        switch self {
        case .notConfigured: "sync not configured"
        case .offline(let reason): "offline: \(reason)"
        case .server(let reason): "server: \(reason)"
        case .auth(let reason): "auth: \(reason)"
        }
    }
}

/// Where the app's Supabase project is: URL and publishable key, from Info.plist (filled from
/// `Config/Local.xcconfig`, gitignored). Never a `service_role` key or another secret.
public struct SyncConfig: Hashable, Sendable {
    public let url: URL
    public let publishableKey: String

    public init(url: URL, publishableKey: String) {
        self.url = url
        self.publishableKey = publishableKey
    }

    /// Info.plist keys of the app (`SKSupabaseURL`, `SKSupabasePublishableKey`).
    public static let urlKey = "SKSupabaseURL"
    public static let keyKey = "SKSupabasePublishableKey"

    /// From Info.plist values; `nil` when a value is missing, empty, an unexpanded build
    /// setting, or not an https URL.
    public init?(info: [String: Any]) {
        guard let rawURL = (info[Self.urlKey] as? String)?.trimmingCharacters(in: .whitespaces),
              let key = (info[Self.keyKey] as? String)?.trimmingCharacters(in: .whitespaces),
              !rawURL.isEmpty, !key.isEmpty, !rawURL.contains("$("), !key.contains("$("),
              let url = URL(string: rawURL), url.scheme == "https", url.host != nil
        else { return nil }
        self.init(url: url, publishableKey: key)
    }
}
