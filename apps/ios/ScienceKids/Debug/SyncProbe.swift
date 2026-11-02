#if DEBUG
import Foundation
import Sync
import SwiftUI

/// `-SKSyncProbe YES` (SK-022 UI tests): an invisible accessibility element `debug.sync` whose
/// value is the sync state as JSON. Ids are cut to 8 characters; no URL, key or token is in it.
struct SyncProbe: View {
    let app: AppModel

    private struct Snapshot: Encodable {
        let phase: String
        let queued: Int
        let user: String?
        let profile: String?
        let profileSameId: Bool?
        let acknowledged: Int
        let rejected: Int
        let homeToday: String?
        let homeStars: Int?
        let homeStreak: Int?
        let homeAttempts: Int?
        let shownStars: Int?
        let shownStreak: Int?
        let shownSource: String?
    }

    var body: some View {
        Text(verbatim: " ")
            .font(.system(size: 1))
            .frame(width: 1, height: 1)
            .opacity(0.01)
            .allowsHitTesting(false)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text(verbatim: "sync probe"))
            .accessibilityValue(Text(verbatim: json))
            .accessibilityIdentifier("debug.sync")
    }

    private var json: String {
        guard let sync = app.sync else { return "{}" }
        let progress = app.profile.map { app.homeProgress(for: $0) }
        let snapshot = Snapshot(
            phase: Self.name(sync.phase),
            queued: sync.queuedCount,
            user: sync.userId.map { String($0.prefix(8)) },
            profile: sync.profileLink?.status.rawValue,
            profileSameId: sync.profileLink?.serverId.map { $0 == app.profile?.id },
            acknowledged: sync.acknowledgedCount,
            rejected: sync.rejected.count,
            homeToday: sync.home?.today,
            homeStars: sync.home?.totalStars,
            homeStreak: sync.home?.streak?.studiedDays,
            homeAttempts: sync.home.map { $0.lessons.compactMap(\.attemptsCount).reduce(0, +) },
            shownStars: progress?.stars,
            shownStreak: progress?.streakDays,
            shownSource: progress.map { $0.source == .server ? "server" : "device" }
        )
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        return (try? encoder.encode(snapshot)).map { String(decoding: $0, as: UTF8.self) } ?? "{}"
    }

    private static func name(_ phase: SyncEngine.Phase) -> String {
        switch phase {
        case .off: "off"
        case .idle: "idle"
        case .syncing: "syncing"
        case .synced: "synced"
        case .waiting(let reason): "waiting: \(reason)"
        }
    }
}
#endif
