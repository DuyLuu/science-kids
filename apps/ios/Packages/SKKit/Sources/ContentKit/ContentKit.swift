import ContentModel

/// `ContentKit` reads content: a folder of schema v1 files (`LocalContentLibrary`, SK-011) or a
/// content pack checked against its manifest (`ContentPack`, `PackSource`, SK-016).
public enum ContentKitModule {
    public static let name = "ContentKit"
    /// Modules ContentKit builds on (technical-plan B7.1).
    public static let dependencies = [ContentModelModule.name]
}
