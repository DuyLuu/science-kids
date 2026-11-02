import ContentModel
import Foundation
import os

/// The topics and lessons the app can show, already decoded (SK-011).
///
/// Until the pack of SK-015 / SK-016 is embedded, the app builds this from a folder of schema v1
/// files (`LocalContentLibrary`, the fixtures folder in the bundle). The pack loader will build
/// the same value, so the screens do not change when the source does.
public struct ContentLibrary: Sendable, Equatable {
    public let topics: [TopicContent]

    public init(topics: [TopicContent]) {
        self.topics = topics.sorted { ($0.topic.order, $0.topic.slug) < ($1.topic.order, $1.topic.slug) }
    }

    public static let empty = ContentLibrary(topics: [])

    /// Topics of one age group, in journey order (`topic.order`, easy → hard).
    public func topics(for ageGroup: Topic.AgeGroup) -> [TopicContent] {
        topics.filter { $0.topic.ageGroup == ageGroup }
    }

    public func topic(id: UUID) -> TopicContent? {
        topics.first { $0.topic.id == id }
    }

    public func lesson(id: UUID) -> (topic: TopicContent, lesson: Lesson)? {
        for topic in topics {
            if let lesson = topic.lessons.first(where: { $0.id == id }) { return (topic, lesson) }
        }
        return nil
    }
}

/// One topic with the lessons the app has for it, in `lesson.order`.
public struct TopicContent: Sendable, Equatable, Identifiable {
    public let topic: Topic
    public let lessons: [Lesson]

    public init(topic: Topic, lessons: [Lesson]) {
        self.topic = topic
        self.lessons = lessons.sorted { ($0.order, $0.slug) < ($1.order, $1.slug) }
    }

    public var id: UUID { topic.id }
}

/// Builds a `ContentLibrary` from a folder of content files (`kind: "topic"` and `kind: "lesson"`,
/// any depth), the layout of `packages/content-schema/fixtures/valid/`.
///
/// What it leaves out, each with a log line (category `content`), never a crash:
/// - a file that does not decode (`ContentDecodingError` path in the log);
/// - a lesson whose `topic_id` matches no topic;
/// - an `archived` topic or lesson, and a `sensitive` one (B4: hidden until a parent turns it on,
///   which needs the Parent Area).
public enum LocalContentLibrary {
    public struct Skipped: Sendable, Equatable, CustomStringConvertible {
        /// Path relative to the folder.
        public let file: String
        public let reason: String

        public var description: String { "\(file): \(reason)" }
    }

    public static func load(
        from root: URL,
        decoder: ContentDecoder = ContentDecoder(),
        log: Logger = Logger(subsystem: Bundle.main.bundleIdentifier ?? "ScienceKids", category: "content")
    ) -> (library: ContentLibrary, skipped: [Skipped]) {
        var topics: [Topic] = []
        var lessons: [(file: String, lesson: Lesson)] = []
        var skipped: [Skipped] = []

        for url in jsonFiles(in: root) {
            let file = relativePath(of: url, in: root)
            do {
                let data = try Data(contentsOf: url)
                switch try kind(of: data) {
                case "topic":
                    topics.append(try decoder.decodeTopic(from: data))
                case "lesson":
                    lessons.append((file, try decoder.decodeLesson(from: data)))
                case let other:
                    skipped.append(Skipped(file: file, reason: "not a topic or lesson (kind \(other ?? "missing"))"))
                }
            } catch let error as ContentDecodingError {
                skipped.append(Skipped(file: file, reason: "does not decode: \(error)"))
            } catch {
                skipped.append(Skipped(file: file, reason: "unreadable: \(error.localizedDescription)"))
            }
        }

        var shown: [TopicContent] = []
        let topicIDs = Set(topics.map(\.id))
        for (file, lesson) in lessons where !topicIDs.contains(lesson.topicId) {
            skipped.append(Skipped(file: file, reason: "topic_id \(lesson.topicId.uuidString.lowercased()) has no topic"))
        }
        for topic in topics {
            if topic.archived || topic.sensitive {
                skipped.append(Skipped(file: topic.slug, reason: topic.archived ? "topic archived" : "topic sensitive"))
                continue
            }
            var own: [Lesson] = []
            for (file, lesson) in lessons where lesson.topicId == topic.id {
                if lesson.archived || lesson.sensitive {
                    skipped.append(Skipped(file: file, reason: lesson.archived ? "lesson archived" : "lesson sensitive"))
                } else {
                    own.append(lesson)
                }
            }
            shown.append(TopicContent(topic: topic, lessons: own))
        }

        for entry in skipped {
            log.notice("library skipped \(entry.description, privacy: .public)")
        }
        return (ContentLibrary(topics: shown), skipped)
    }

    /// Every `*.json` under `dir`, sorted by path so the result does not depend on the file system.
    static func jsonFiles(in dir: URL) -> [URL] {
        let enumerator = FileManager.default.enumerator(at: dir, includingPropertiesForKeys: nil)
        var files: [URL] = []
        while let url = enumerator?.nextObject() as? URL {
            if url.pathExtension == "json" { files.append(url) }
        }
        return files.sorted { $0.path < $1.path }
    }

    static func relativePath(of url: URL, in root: URL) -> String {
        let base = root.standardizedFileURL.path
        let path = url.standardizedFileURL.path
        return path.hasPrefix(base + "/") ? String(path.dropFirst(base.count + 1)) : url.lastPathComponent
    }

    /// Root `kind` of a content file, without decoding the rest.
    static func kind(of data: Data) throws -> String? {
        struct Kind: Decodable { let kind: String? }
        do {
            return try JSONDecoder().decode(Kind.self, from: data).kind
        } catch {
            throw ContentDecodingError(path: "/", message: "not a JSON object")
        }
    }
}
