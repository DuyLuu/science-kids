import Foundation
import os

/// Decodes topic and lesson files and logs what the app skipped.
///
/// Use this instead of a bare `JSONDecoder`: it turns `DecodingError` into `ContentDecodingError`
/// (with the JSON pointer of the bad field) and reports every `Lesson.skipped` entry to `log`.
public struct ContentDecoder: Sendable {
    public let log: any ContentLog

    public init(log: any ContentLog = OSContentLog()) {
        self.log = log
    }

    public func decodeTopic(from data: Data) throws(ContentDecodingError) -> Topic {
        try Self.decode(Topic.self, from: data)
    }

    public func decodeLesson(from data: Data) throws(ContentDecodingError) -> Lesson {
        let lesson = try Self.decode(Lesson.self, from: data)
        for entry in lesson.skipped {
            log.didSkip(entry, lessonID: lesson.id)
        }
        return lesson
    }

    static func decode<T: Decodable>(_ type: T.Type, from data: Data) throws(ContentDecodingError) -> T {
        do {
            return try JSONDecoder().decode(type, from: data)
        } catch let error as DecodingError {
            throw ContentDecodingError(error)
        } catch {
            throw ContentDecodingError(path: "/", message: error.localizedDescription)
        }
    }
}

/// A content file that does not decode. `path` is a JSON pointer, like the CLI prints (`/title`, `/quiz/2/options/0/key`).
public struct ContentDecodingError: Error, Hashable, Sendable, CustomStringConvertible {
    public let path: String
    public let message: String

    public init(path: String, message: String) {
        self.path = path
        self.message = message
    }

    public init(_ error: DecodingError) {
        switch error {
        case .keyNotFound(let key, let context):
            self.init(path: Self.pointer(context.codingPath + [key]), message: "missing required field")
        case .typeMismatch(let type, let context):
            self.init(path: Self.pointer(context.codingPath), message: "expected \(type): \(context.debugDescription)")
        case .valueNotFound(let type, let context):
            self.init(path: Self.pointer(context.codingPath), message: "null where \(type) is required")
        case .dataCorrupted(let context):
            self.init(path: Self.pointer(context.codingPath), message: context.debugDescription)
        @unknown default:
            self.init(path: "/", message: String(describing: error))
        }
    }

    public var description: String { "\(path) \(message)" }

    /// RFC 6901 pointer; array indices come from `intValue`.
    static func pointer(_ codingPath: [any CodingKey]) -> String {
        guard !codingPath.isEmpty else { return "/" }
        return codingPath.map { key in
            let token = key.intValue.map(String.init) ?? key.stringValue
            return "/" + token.replacingOccurrences(of: "~", with: "~0").replacingOccurrences(of: "/", with: "~1")
        }.joined()
    }
}

/// Where `ContentDecoder` reports skipped blocks and questions.
public protocol ContentLog: Sendable {
    func didSkip(_ entry: SkippedContent, lessonID: UUID)
}

/// Default log: `os.Logger`, category `content`.
public struct OSContentLog: ContentLog {
    let logger: Logger

    public init() {
        logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "content")
    }

    public func didSkip(_ entry: SkippedContent, lessonID: UUID) {
        logger.notice(
            "lesson \(lessonID.uuidString.lowercased(), privacy: .public) skipped \(entry.description, privacy: .public)"
        )
    }
}
