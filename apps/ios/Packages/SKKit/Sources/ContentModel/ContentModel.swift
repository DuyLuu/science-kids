/// `ContentModel`: hand-written Codable models of content schema v1 (SK-009, technical-plan B3, B4.1–B4.3).
///
/// Source of truth: `packages/content-schema/schema/*.schema.json`. Entry point: `ContentDecoder`.
/// The app reads more loosely than `content-cli validate`: unknown fields are ignored, unknown
/// block types and quiz formats are dropped and logged, open string enums accept new values.
/// Missing or mistyped required fields still fail, with the JSON pointer of the field.
public enum ContentModelModule {
    public static let name = "ContentModel"
    /// Content schema version this module reads.
    public static let schemaVersion = 1
}
