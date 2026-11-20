import XCTest

/// SK-059: on Chơi a tap on a shelf picture opens it big; a picture is picked by a long press
/// then a drag onto the tray. UI tests that only need foods on the tray use `pick`.
@MainActor
enum PlayDrag {
    /// Launch arguments of a UI test that is not about the first-time hint.
    nonisolated static let noHint = ["-SKNoPlayHint", "YES"]

    /// Long press (longer than the app's 0.3 s) on the shelf picture, then a drag onto the tray.
    static func pick(_ app: XCUIApplication, _ key: String, expectOnTray: Bool = true,
                     file: StaticString = #filePath, line: UInt = #line) {
        let item = app.buttons["lesson.shelf.\(key)"].firstMatch
        guard item.waitForExistence(timeout: 5) else {
            XCTFail("no shelf picture \(key)", file: file, line: line)
            return
        }
        let tray = app.descendants(matching: .any)["lesson.play.tray"].firstMatch
        XCTAssertTrue(tray.waitForExistence(timeout: 3), "no tray", file: file, line: line)
        item.press(forDuration: 0.6, thenDragTo: tray)
        if expectOnTray {
            XCTAssertTrue(app.buttons["lesson.tray.\(key)"].firstMatch.waitForExistence(timeout: 3),
                          "\(key) did not go on the tray", file: file, line: line)
        }
    }

    /// A tap on the picture in the tray takes it off (as before SK-059).
    static func unpick(_ app: XCUIApplication, _ key: String, file: StaticString = #filePath, line: UInt = #line) {
        let item = app.buttons["lesson.tray.\(key)"].firstMatch
        XCTAssertTrue(item.waitForExistence(timeout: 3), "\(key) is not on the tray", file: file, line: line)
        item.tap()
    }
}
