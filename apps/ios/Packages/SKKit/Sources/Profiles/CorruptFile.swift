import Foundation

/// A data file of the app that no longer decodes is never overwritten in place (SK-022, tester's
/// findings on SK-011 and SK-012): it is renamed `<name>.corrupt-<UTC time>` next to where it was,
/// so whatever is in it can still be read by hand, and the app starts that file afresh.
public enum CorruptFile {
    /// Renames `url` to `<name>.corrupt-<yyyyMMdd'T'HHmmss'Z'>` (with `-2`, `-3`… if taken) and
    /// returns the new place. Throws when the rename fails (the caller then logs and goes on).
    @discardableResult
    public static func quarantine(_ url: URL, now: Date = Date()) throws -> URL {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(identifier: "UTC")
        formatter.dateFormat = "yyyyMMdd'T'HHmmss'Z'"
        let base = url.lastPathComponent + ".corrupt-" + formatter.string(from: now)
        let directory = url.deletingLastPathComponent()
        var target = directory.appendingPathComponent(base)
        var counter = 2
        while FileManager.default.fileExists(atPath: target.path) {
            target = directory.appendingPathComponent("\(base)-\(counter)")
            counter += 1
        }
        try FileManager.default.moveItem(at: url, to: target)
        return target
    }
}
