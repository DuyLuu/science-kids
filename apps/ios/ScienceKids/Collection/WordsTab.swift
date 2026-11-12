import AudioKit
import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// Tab Từ vựng (SK-035, canvas `Discoverer-Words`): one deck of flashcards per lesson the child has
/// done, with how many of its words the child knows. A deck opens on its own screen
/// (`WordDeckScreen`, the `.words` route), since the canvas showed a single lesson's deck and the
/// tab now holds every lesson done.
struct WordsTab: View {
    let app: AppModel
    let profile: ChildProfile

    var body: some View {
        let decks = app.wordDecks(for: profile)
        let known = app.knownWords(for: profile)
        let count = WordDecks.count(decks, known: known)
        let mode = profile.languageMode
        VStack(alignment: .leading, spacing: CollectionMetrics.pageGap) {
            CollectionHeader(title: Text("words.title"), caption: Text("words.subtitle"), identifier: "words.title") {
                CountChip(
                    value: "\(count.known)/\(count.total)",
                    unit: Text("words.unit"),
                    label: Text("words.count_a11y \(count.known) \(count.total)"),
                    identifier: "words.count"
                ) {
                    PaperIconView(.book, size: CollectionMetrics.chipIcon, color: Tokens.Role.actionPrimary)
                }
            }
            .reveal(order: 0)
            if decks.isEmpty {
                InviteCard(app: app, profile: profile, message: "words.empty")
                    .reveal(order: 1)
            }
            ForEach(Array(decks.enumerated()), id: \.element.id) { index, deck in
                DeckRow(deck: deck, known: deck.knownCount(known), mode: mode) {
                    app.openWordDeck(deck.id)
                }
                .reveal(order: 2 + index)
            }
        }
    }
}

/// A lesson's deck on the list: the lesson's number on its đỏ son tile, the topic, the lesson's
/// title, "Đã nhớ a/b từ", the play disc. A button: it opens the deck.
private struct DeckRow: View {
    let deck: WordDeck
    let known: Int
    let mode: LanguageMode
    let action: () -> Void
    @Environment(\.ageGroup) private var ageGroup

    var body: some View {
        let total = deck.words.count
        let title = mode.name(deck.lesson.title)
        Button(action: action) {
            HStack(spacing: Tokens.Space.s12) {
                Text(verbatim: "\(deck.lessonNumber)")
                    .typography(Tokens.Typography.title, fixedBox: true)
                    .foregroundStyle(Tokens.Role.textOnAccent)
                    .frame(width: PaperMetrics.lessonNumberTile, height: PaperMetrics.lessonNumberTile)
                    .paperSurface(Tokens.Role.actionPrimary, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.tag)
                    .rotationEffect(Tokens.Shape.tiltStamp)
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    Text(verbatim: mode.name(deck.topic.title))
                        .typography(Tokens.Typography.captionS)
                        .foregroundStyle(Tokens.Role.textSecondary)
                    Text(verbatim: title)
                        .typography(Tokens.Typography.itemTitle)
                        .fixedSize(horizontal: false, vertical: true)
                    Text("words.deck.known \(known) \(total)")
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(known == total ? Tokens.Role.textCorrect : Tokens.Role.textAccent)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                PaperPlayDisc(size: PaperMetrics.playDiscSmall)
            }
            .foregroundStyle(Tokens.Role.textPrimary)
            .padding(CollectionMetrics.deckRowPadding)
            .frame(maxWidth: .infinity, minHeight: max(PaperMetrics.lessonRowMinHeight, ageGroup.touchTarget), alignment: .leading)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, cornerRadius: ageGroup.radius)
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text("words.deck_a11y \(deck.lessonNumber) \(SpeechText.marked(title, mode.nameLanguage)) \(known) \(total)"))
        .accessibilityIdentifier("words.deck.\(deck.lessonNumber).\(deck.topic.key)")
    }
}

// MARK: - A deck

/// A lesson's flashcards (canvas `Discoverer-Words`): "Đã nhớ x/n" and the word's place, a
/// segment per word, the card (English word and picture; tap: its meaning and example), a listen
/// button, "Ôn lại" and "Đã nhớ". Each mark is saved for the child at once. After the last word,
/// "Xong cả n từ!" with "Ôn từ đầu" and "Về hành trình".
///
/// One reveal when the screen opens; each new card slides in (`slide`); the card turns over with
/// `flip`. Reduce Motion: no slide, the card shows its other side at once.
struct WordDeckScreen: View {
    let app: AppModel
    let deck: WordDeck
    let profile: ChildProfile

    @State private var review: WordReview?
    @State private var flipped = false
    /// The side shown once the turn has ended (as on Thưởng).
    @State private var settledFlipped = false
    /// Height of the taller side's content at the card's width (`readingHeight`).
    @State private var faceHeight: CGFloat = 0
    /// The last mark could not be saved (tester 10/11 #4): a short note under the buttons.
    @State private var saveFailed = false
    @ReducedMotion private var reduced

    private var mode: LanguageMode { profile.languageMode }

    var body: some View {
        let known = deck.knownCount(app.knownWords(for: profile))
        PaperFrame(scrolls: true) {
            VStack(alignment: .leading, spacing: CollectionMetrics.pageGap) {
                ScreenHeader(
                    back: .init(label: Text("words.back"), action: app.goBack),
                    title: Text("words.title"),
                    caption: Text("words.deck.caption \(mode.name(deck.topic.title)) \(deck.lessonNumber)"),
                    titleIdentifier: "words.deck.title"
                ) {
                    CountChip(
                        value: "\(deck.words.count)",
                        unit: Text("words.unit"),
                        label: Text("words.deck.size_a11y \(deck.words.count)"),
                        identifier: "words.deck.size"
                    ) {
                        Circle()
                            .fill(Tokens.Role.textAccent)
                            .frame(width: CollectionMetrics.dot, height: CollectionMetrics.dot)
                    }
                }
                .reveal(order: 0)
                if let review {
                    ReviewProgress(review: review, known: known)
                        .reveal(order: 1)
                    if let word = review.current {
                        card(word, review: review)
                    } else {
                        done(review: review, known: known)
                    }
                }
            }
        }
        .onAppear {
            if review == nil { review = WordReview(words: deck.words, known: app.knownWords(for: profile)) }
        }
    }

    // MARK: Card

    @ViewBuilder private func card(_ word: VocabTerm, review: WordReview) -> some View {
        Button {
            flipped.toggle()
        } label: {
            FlipCard(isFlipped: flipped) {
                face(word, front: true, review: review)
            } back: {
                face(word, front: false, review: review)
            }
            .readingHeight(of: ZStack { frontContent(word, review: review); backContent(word) }, into: $faceHeight)
            .background {
                ZStack {
                    paperLayer(Tokens.Role.surfaceInactive, tilt: CollectionMetrics.wordLayerTilts.0)
                        .opacity(review.words.count - review.index >= 3 ? 1 : 0)
                    paperLayer(Tokens.Role.surfacePaper, tilt: CollectionMetrics.wordLayerTilts.1)
                        .opacity(review.words.count - review.index >= 2 ? 1 : 0)
                }
                .accessibilityHidden(true)
            }
            .padding(.horizontal, CollectionMetrics.wordCardInset)
        }
        .buttonStyle(.paperPress)
        // The English word marked English for a Vietnamese VoiceOver voice (content-editor 10/11);
        // the example as the card shows it, by `language_mode` (tester 10/11 #10).
        .accessibilityLabel(flipped
            ? Text("words.card.back_a11y \(SpeechText.marked(word.term.vi, .vi))")
            : Text("words.card.front_a11y \(SpeechText.marked(word.term.en, .en))"))
        .accessibilityValue(flipped ? SpeechText.lines(word.example, mode: mode) : Text(verbatim: ""))
        .accessibilityIdentifier("words.card")
        .task(id: flipped) {
            if !reduced { try? await Task.sleep(for: .seconds(Tokens.Motion.Preset.flip.duration)) }
            if !Task.isCancelled { settledFlipped = flipped }
        }
        // A new card for each word: it slides in (the motion's state goes with the card).
        .motion(Tokens.Motion.Preset.slide)
        .id(review.index)

        HStack(spacing: Tokens.Space.s12) {
            ListenButton(
                flipped
                    ? Utterance(id: "words.example.\(word.key)", [word.term, word.example], voice: profile.voiceMode)
                    // The front is the English word being learnt: its English clip, whatever the
                    // voice (the meaning would give the back away).
                    : Utterance(id: "words.word.\(word.key)", [word.term], voice: .en),
                label: flipped ? "words.listen.example" : "words.listen.word",
                disc: .paper
            )
            HStack(spacing: Tokens.Space.s6) {
                PaperIconView(.retry, size: CollectionMetrics.chipIcon, color: Tokens.Role.textSecondary)
                Text("words.hint")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            .accessibilityHidden(true)
        }
        .frame(maxWidth: .infinity)
        .reveal(order: 3)

        HStack(alignment: .top, spacing: Tokens.Space.s12) {
            TwoLayerButton("words.again", role: .secondary) { mark(.again, word) }
                .accessibilityIdentifier("words.again")
            TwoLayerButton("words.known", icon: .check) { mark(.known, word) }
                .accessibilityIdentifier("words.known")
        }
        .reveal(order: 4)
        if saveFailed {
            Text("words.save_failed")
                .typography(Tokens.Typography.caption)
                .foregroundStyle(Tokens.Role.textAccent)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityIdentifier("words.save_failed")
        }
    }

    private func paperLayer(_ fill: Color, tilt: Angle) -> some View {
        RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous)
            .fill(fill)
            .rotationEffect(tilt)
            .paperDropShadow(Tokens.Shadow.paper3)
    }

    /// One side, `wordCardHeight` tall or the taller side's content (`faceHeight`), so the two
    /// sides always match whatever the text size. The front has the word's place in its corner.
    private func face(_ word: VocabTerm, front: Bool, review: WordReview) -> some View {
        let shape = RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous)
        let showsContent = front ? (!flipped || !settledFlipped) : (flipped || settledFlipped)
        // The side facing away has no content once the turn is over (tester 10/11 #17).
        return Group {
            if showsContent {
                if front { frontContent(word, review: review) } else { backContent(word) }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(height: max(CollectionMetrics.wordCardHeight, faceHeight))
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper3, in: shape)
    }

    private func frontContent(_ word: VocabTerm, review: WordReview) -> some View {
        VStack(spacing: Tokens.Space.s16) {
            Text("words.position \(review.index + 1) \(review.words.count)")
                .typography(Tokens.Typography.label)
                .foregroundStyle(Tokens.Role.textSecondary)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer(minLength: 0)
            ContentPicture(asset: word.image?.asset, color: nil, size: CollectionMetrics.wordArt, box: .square,
                           accessibilityLabel: word.image.map { Text(SpeechText.marked($0.alt.text(in: mode.nameLanguage), mode.nameLanguage)) })
                .frame(width: CollectionMetrics.wordArt, height: CollectionMetrics.wordArt)
            Text(verbatim: word.term.en)
                .typography(CollectionMetrics.wordTypography)
                .multilineTextAlignment(.center)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 0)
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .padding(CollectionMetrics.wordFrontPadding)
    }

    private func backContent(_ word: VocabTerm) -> some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s6) {
            Text("words.meaning \(SpeechText.marked(word.term.en, .en))")
                .typography(Tokens.Typography.bodyStrong)
                .foregroundStyle(Tokens.Role.textSecondary)
            Text(verbatim: word.term.vi)
                .typography(CollectionMetrics.meaningTypography)
                .foregroundStyle(Tokens.Role.textAccent)
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: Tokens.Space.s12)
            VStack(alignment: .leading, spacing: Tokens.Space.s4) {
                Text(verbatim: word.example.en)
                    .typography(Tokens.Typography.sentence)
                    .fixedSize(horizontal: false, vertical: true)
                Text(verbatim: word.example.vi)
                    .typography(Tokens.Typography.bodyS)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(CollectionMetrics.examplePadding)
            .frame(maxWidth: .infinity, minHeight: CollectionMetrics.exampleMinHeight, alignment: .leading)
            .paperSurface(Tokens.Role.bgScreen, cornerRadius: Tokens.Radius.discoverer)
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .multilineTextAlignment(.leading)
        .padding(CollectionMetrics.wordBackPadding)
        .frame(maxWidth: .infinity, alignment: .leading)
    }

    /// Saves the mark, then the next word; a mark that could not be saved leaves the known words as
    /// they were and says so under the buttons, the pass still goes on.
    private func mark(_ mark: WordReview.Mark, _ word: VocabTerm) {
        saveFailed = !app.mark(mark, word: word, for: profile)
        flipped = false
        settledFlipped = false
        review?.mark(mark)
    }

    // MARK: Done

    @ViewBuilder private func done(review: WordReview, known: Int) -> some View {
        let total = deck.words.count
        PaperCard {
            VStack(spacing: Tokens.Space.s8) {
                Seal(Text("words.done.stamp"), tone: .mark)
                    .accessibilityHidden(true)
                Text("words.done.title \(total)")
                    .typography(Tokens.Typography.titleL)
                    .padding(.top, Tokens.Space.s8)
                    .accessibilityAddTraits(.isHeader)
                    .accessibilityIdentifier("words.done.title")
                Text("words.done.body \(known) \(total)")
                    .typography(Tokens.Typography.body)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .accessibilityIdentifier("words.done.body")
                if review.againCount > 0 {
                    Text("words.done.next \(review.againCount)")
                        .typography(Tokens.Typography.caption)
                        .padding(.horizontal, Tokens.Space.s12)
                        .padding(.vertical, Tokens.Space.s8)
                        .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.paper1, cornerRadius: Tokens.Radius.tag)
                        .padding(.top, Tokens.Space.s4)
                }
            }
            .multilineTextAlignment(.center)
            .fixedSize(horizontal: false, vertical: true)
            .frame(maxWidth: .infinity)
        }
        .accessibilityElement(children: .combine)
        .accessibilityIdentifier("words.done")
        .reveal(order: 2)
        HStack(alignment: .top, spacing: Tokens.Space.s12) {
            TwoLayerButton("words.done.restart", role: .secondary) {
                saveFailed = false
                self.review = WordReview(words: deck.words, known: app.knownWords(for: profile))
            }
            .accessibilityIdentifier("words.done.restart")
            TwoLayerButton("words.done.home", icon: .arrowForward) { app.showTab(.journey) }
                .accessibilityIdentifier("words.done.home")
        }
        .reveal(order: 3)
    }
}

/// "Đã nhớ x/n" (the deck's words the child knows), "Từ i/n", and a segment per word of the pass:
/// known (đỏ son), passed for "Ôn lại" (paper), the one shown (vàng hoè), still to come (pressed in).
private struct ReviewProgress: View {
    let review: WordReview
    let known: Int

    var body: some View {
        let total = review.words.count
        let position = min(review.index + 1, total)
        VStack(alignment: .leading, spacing: Tokens.Space.s8) {
            HStack(alignment: .firstTextBaseline) {
                HStack(alignment: .firstTextBaseline, spacing: Tokens.Space.s6) {
                    Text("words.progress.known")
                    Text(verbatim: "\(known)").foregroundStyle(Tokens.Role.textAccent)
                        + Text(verbatim: "/\(total)")
                }
                .typography(Tokens.Typography.buttonS)
                Spacer(minLength: Tokens.Space.s8)
                Text("words.position \(position) \(total)")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
            }
            HStack(spacing: CollectionMetrics.segmentGap) {
                ForEach(0..<total, id: \.self) { index in
                    segment(index)
                        .frame(maxWidth: .infinity)
                        .frame(height: CollectionMetrics.segmentHeight)
                }
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("words.progress_a11y \(known) \(position) \(total)"))
        .accessibilityIdentifier("words.progress")
    }

    @ViewBuilder private func segment(_ index: Int) -> some View {
        let shape = RoundedRectangle(cornerRadius: Tokens.Radius.bar, style: .continuous)
        if index < review.marks.count {
            Color.clear.paperSurface(
                review.marks[index] == .known ? Tokens.Role.actionPrimary : Tokens.Role.surfacePaper,
                shadow: Tokens.Shadow.paper1, in: shape
            )
        } else if index == review.index {
            Color.clear.paperSurface(Tokens.Role.stateCurrent, shadow: Tokens.Shadow.paper1, in: shape)
        } else {
            Color.clear.paperSurface(Tokens.Role.surfaceSunken, shadow: Tokens.Shadow.sunkenS, in: shape)
        }
    }
}
