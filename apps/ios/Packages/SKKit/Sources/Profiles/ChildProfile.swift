import Foundation

/// A child profile kept on the device (SK-011). Field names are the columns of `child_profiles`
/// (technical-plan B5.3), so SK-022 can send the file to the server without renaming anything.
/// Server-only columns (`owner_id`, `daily_limit_min`, `locked_reason`, `archived_at`) are not here.
///
/// No birth date, photo, email or voice (B12): only a nickname, a ready-made avatar, the grade
/// and the two language settings.
public struct ChildProfile: Codable, Hashable, Sendable, Identifiable {
    /// Made on the device (UUID v4), written lower case.
    public let id: UUID
    /// Nickname, trimmed, at most `maxNameLength` characters.
    public var displayName: String
    /// Id of a ready-made avatar (`ca`, `ech`, `ga`, `meo`, `chim`, `trau` on the canvas).
    public var avatar: String
    /// Vietnamese grade, 1–5.
    public var grade: Int
    public var ageGroup: AgeGroup
    public var languageMode: LanguageMode
    public var voiceMode: VoiceMode
    /// IANA time zone of the device when the profile was made (`Asia/Ho_Chi_Minh`), for local dates.
    public var timezone: String
    /// Whole seconds, written ISO 8601 in UTC.
    public let createdAt: Date

    /// Canvas `Discoverer-Profile`: the name field keeps the first 20 characters.
    public static let maxNameLength = 20

    public init(
        id: UUID,
        displayName: String,
        avatar: String,
        grade: Int,
        ageGroup: AgeGroup,
        languageMode: LanguageMode,
        voiceMode: VoiceMode,
        timezone: String,
        createdAt: Date
    ) {
        self.id = id
        self.displayName = displayName
        self.avatar = avatar
        self.grade = grade
        self.ageGroup = ageGroup
        self.languageMode = languageMode
        self.voiceMode = voiceMode
        self.timezone = timezone
        self.createdAt = createdAt
    }

    /// A new profile from what the parent entered: the name is normalised, the age group
    /// follows the grade, `created_at` is `now` cut to whole seconds (so the file reads back equal).
    public static func create(
        displayName: String,
        avatar: String,
        grade: Int,
        languageMode: LanguageMode,
        voiceMode: VoiceMode,
        timeZone: TimeZone = .current,
        now: Date = Date(),
        id: UUID = UUID()
    ) throws(ProfileError) -> ChildProfile {
        guard let name = normalizedName(displayName) else { throw .emptyName }
        guard !avatar.isEmpty else { throw .missingAvatar }
        guard let ageGroup = Grade.ageGroup(for: grade) else { throw .invalidGrade(grade) }
        return ChildProfile(
            id: id,
            displayName: name,
            avatar: avatar,
            grade: grade,
            ageGroup: ageGroup,
            languageMode: languageMode,
            voiceMode: voiceMode,
            timezone: timeZone.identifier,
            createdAt: Date(timeIntervalSince1970: (now.timeIntervalSince1970).rounded(.down))
        )
    }

    /// The name as stored: whitespace trimmed, at most `maxNameLength` characters; `nil` when nothing is left.
    public static func normalizedName(_ raw: String) -> String? {
        let trimmed = raw.trimmingCharacters(in: .whitespacesAndNewlines)
        let cut = String(trimmed.prefix(maxNameLength)).trimmingCharacters(in: .whitespacesAndNewlines)
        return cut.isEmpty ? nil : cut
    }

    /// The name field as typed, cut to `maxNameLength` characters (leading spaces kept while typing).
    public static func limitedNameInput(_ raw: String) -> String {
        String(raw.prefix(maxNameLength))
    }

    // MARK: - Codable

    enum CodingKeys: String, CodingKey, CaseIterable {
        case id
        case displayName = "display_name"
        case avatar
        case grade
        case ageGroup = "age_group"
        case languageMode = "language_mode"
        case voiceMode = "voice_mode"
        case timezone
        case createdAt = "created_at"
    }

    /// Keys of the JSON file, in `child_profiles` names.
    public static let fieldNames: [String] = CodingKeys.allCases.map(\.rawValue)

    public init(from decoder: any Decoder) throws {
        let c = try decoder.container(keyedBy: CodingKeys.self)
        let idString = try c.decode(String.self, forKey: .id)
        guard let id = UUID(uuidString: idString) else {
            throw DecodingError.dataCorruptedError(forKey: .id, in: c, debugDescription: "not a UUID: \(idString)")
        }
        self.id = id
        displayName = try c.decode(String.self, forKey: .displayName)
        avatar = try c.decode(String.self, forKey: .avatar)
        grade = try c.decode(Int.self, forKey: .grade)
        ageGroup = try c.decode(AgeGroup.self, forKey: .ageGroup)
        languageMode = try c.decode(LanguageMode.self, forKey: .languageMode)
        voiceMode = try c.decode(VoiceMode.self, forKey: .voiceMode)
        timezone = try c.decode(String.self, forKey: .timezone)
        let created = try c.decode(String.self, forKey: .createdAt)
        guard let date = Self.parseTimestamp(created) else {
            throw DecodingError.dataCorruptedError(forKey: .createdAt, in: c, debugDescription: "not ISO 8601: \(created)")
        }
        createdAt = date
    }

    public func encode(to encoder: any Encoder) throws {
        var c = encoder.container(keyedBy: CodingKeys.self)
        try c.encode(id.uuidString.lowercased(), forKey: .id)
        try c.encode(displayName, forKey: .displayName)
        try c.encode(avatar, forKey: .avatar)
        try c.encode(grade, forKey: .grade)
        try c.encode(ageGroup, forKey: .ageGroup)
        try c.encode(languageMode, forKey: .languageMode)
        try c.encode(voiceMode, forKey: .voiceMode)
        try c.encode(timezone, forKey: .timezone)
        try c.encode(createdAt.formatted(.iso8601), forKey: .createdAt)
    }

    /// ISO 8601 with a `Z` or `±hh:mm` offset, with or without milliseconds (a server timestamp
    /// may carry them). A local formatter per call: `ISO8601DateFormatter` is not `Sendable`.
    static func parseTimestamp(_ string: String) -> Date? {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime]
        if let date = formatter.date(from: string) { return date }
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: string)
    }
}

/// Why a profile could not be made from the form.
public enum ProfileError: Error, Equatable, Sendable {
    case emptyName
    case missingAvatar
    case invalidGrade(Int)
}
