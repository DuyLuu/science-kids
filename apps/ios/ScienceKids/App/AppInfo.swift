import Foundation

/// Version and bundle id shown on the placeholder so a tester knows which build runs.
struct AppInfo: Equatable {
    let version: String
    let build: String
    let bundleID: String

    init(bundle: Bundle) {
        version = bundle.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "?"
        build = bundle.object(forInfoDictionaryKey: "CFBundleVersion") as? String ?? "?"
        bundleID = bundle.bundleIdentifier ?? "?"
    }

    var versionLine: String { "\(version) (\(build)) · \(bundleID)" }
}
