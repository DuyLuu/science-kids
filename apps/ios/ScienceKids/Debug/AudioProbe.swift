#if DEBUG
import AudioKit
import Foundation
import SwiftUI

/// `-SKAudioProbe YES` (SK-016 UI tests): an invisible accessibility element `debug.audio` whose
/// value is what the voice player did, as JSON (`SpeechStats` and the utterance playing). The
/// simulator plays the clips, but a UI test cannot hear them; it reads this instead.
struct AudioProbe: View {
    let speech: SpeechPlayer

    private struct Snapshot: Encodable {
        let speaking: String?
        let stats: SpeechStats
    }

    var body: some View {
        Text(verbatim: " ")
            .font(.system(size: 1))
            .frame(width: 1, height: 1)
            .opacity(0.01)
            .allowsHitTesting(false)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel(Text(verbatim: "audio probe"))
            .accessibilityValue(Text(verbatim: json))
            .accessibilityIdentifier("debug.audio")
    }

    private var json: String {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.sortedKeys]
        let data = (try? encoder.encode(Snapshot(speaking: speech.speaking, stats: speech.stats))) ?? Data()
        return String(decoding: data, as: UTF8.self)
    }
}
#endif
