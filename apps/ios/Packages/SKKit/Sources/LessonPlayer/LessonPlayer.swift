import AudioKit
import ContentModel
import DesignSystem
import LessonEngine
import Profiles

/// `LessonPlayer` module marker (SK-005). Real content arrives in SK-012.
public enum LessonPlayerModule {
    public static let name = "LessonPlayer"
    /// Modules LessonPlayer builds on (technical-plan B7.1).
    public static let dependencies = [
        DesignSystemModule.name,
        ContentModelModule.name,
        LessonEngineModule.name,
        AudioKitModule.name,
        "Profiles",
    ]
}
