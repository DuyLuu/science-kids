import CoreGraphics
import Testing
@testable import DesignSystem

/// SK-059 "xem to": the whole photo in its own shape, inside the canvas's maximum box.
@Suite struct WholePictureTests {
    @Test func fitsTheBox() {
        // iPhone box 330 × 460.
        #expect(ContentPicture.wholeSize(aspect: 4.0 / 3.0, maxWidth: 330, maxHeight: 460) == CGSize(width: 330, height: 247.5))
        #expect(ContentPicture.wholeSize(aspect: 0.5, maxWidth: 330, maxHeight: 460) == CGSize(width: 230, height: 460), "portrait: the height limits")
        #expect(ContentPicture.wholeSize(aspect: 1, maxWidth: 520, maxHeight: 640) == CGSize(width: 520, height: 520))
    }

    @Test func notReadYetIsSquare() {
        #expect(ContentPicture.wholeSize(aspect: 0, maxWidth: 330, maxHeight: 460) == CGSize(width: 330, height: 330))
        #expect(ContentPicture.wholeSize(aspect: .nan, maxWidth: 330, maxHeight: 200) == CGSize(width: 200, height: 200))
    }
}
