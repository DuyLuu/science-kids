import Testing
@testable import ContentKit

@Test func moduleIsLinked() {
    #expect(ContentKitModule.name == "ContentKit")
}

@Test func dependsOnContentModel() {
    #expect(ContentKitModule.dependencies == ["ContentModel"])
}
