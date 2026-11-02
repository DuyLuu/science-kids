import Testing
@testable import LessonPlayer

@Test func moduleIsLinked() {
    #expect(LessonPlayerModule.name == "LessonPlayer")
}

/// SK-012 adds `Profiles` (language and voice of the child) to the four modules of B7.1.
@Test func dependsOnFiveModules() {
    #expect(LessonPlayerModule.dependencies == ["DesignSystem", "ContentModel", "LessonEngine", "AudioKit", "Profiles"])
}
