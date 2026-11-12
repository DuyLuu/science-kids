import AudioKit
import ContentKit
import ContentModel
import DesignSystem
import LessonPlayer
import Profiles
import SwiftUI

/// Tab Thẻ (SK-035, canvas `Discoverer-Cards`): the collectible cards of the written lessons, one
/// set per topic. A card won shows its front and opens (tap) to turn over to "Em có biết?"; a card
/// not won yet lies face down with "?" and the lesson it comes from; "+N" counts the lessons of
/// the topic not written yet. A card is won by finishing its lesson, the rule of the Thưởng screen.
///
/// Adapted from the canvas, drawn for the Healthy eating cards: no food-group chips (a set is a
/// topic now), no "Thẻ hiếm" and no "MỚI" stamp (no rare card in the pack; SK-035 out of scope).
struct CardsTab: View {
    let app: AppModel
    let profile: ChildProfile
    @Environment(\.layoutMetrics) private var metrics
    @Environment(\.speechPlayer) private var speech
    @Environment(\.pictureStore) private var pictures
    @Environment(\.ageGroup) private var ageGroup
    @Environment(\.reduceMotionOverride) private var reduceMotionOverride
    /// The card open over the tab.
    @State private var opened: CardSlot?

    var body: some View {
        let collection = app.cardCollection(for: profile)
        let mode = profile.languageMode
        VStack(alignment: .leading, spacing: CollectionMetrics.pageGap) {
            CollectionHeader(
                title: Text("cards.title"),
                caption: Text("cards.subtitle"),
                identifier: "cards.title"
            ) {
                CountChip(
                    value: "\(collection.earnedCount)/\(collection.totalCount)",
                    unit: Text("cards.unit"),
                    label: Text("cards.count_a11y \(collection.earnedCount) \(collection.totalCount)"),
                    identifier: "cards.count"
                ) {
                    PaperIconView(.cards, size: CollectionMetrics.chipIcon, color: Tokens.Role.actionPrimary)
                }
            }
            .reveal(order: 0)
            if collection.earnedCount == 0 {
                InviteCard(app: app, profile: profile, message: "cards.empty")
                    .reveal(order: 1)
            }
            ForEach(Array(collection.sets.enumerated()), id: \.element.id) { index, set in
                CardSetSection(set: set, mode: mode, columns: columns) { open($0) }
                    .reveal(order: 2 + index)
            }
            if collection.laterTopics > 0 {
                Text("cards.later_topics \(collection.laterTopics)")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
                    .reveal(order: 2 + collection.sets.count)
                    .accessibilityIdentifier("cards.later_topics")
            }
        }
        .fullScreenCover(item: $opened) { slot in
            CardDetail(slot: slot, profile: profile) { close() }
                // A cover does not take the screen's environment with it: the voice, the pictures,
                // the world and its own width (B7.10).
                .environment(\.speechPlayer, speech)
                .environment(\.pictureStore, pictures)
                .environment(\.ageGroup, ageGroup)
                .environment(\.reduceMotionOverride, reduceMotionOverride)
                .layoutMetricsFromContainer()
                .dynamicTypeSize(...Tokens.Typography.DynamicType.maxCategory)
                .presentationBackground(Tokens.Role.surfaceSunken)
        }
    }

    /// 3 columns on the phone, 4 in a wide iPad column.
    private var columns: Int {
        min(metrics.contentWidth, CollectionMetrics.columnMaxWidth) >= CollectionMetrics.cardWideFrom ? 4 : 3
    }

    /// The card opens over the tab with no system slide: the card itself pops in (`pop`, off
    /// with Reduce Motion), as on the canvas.
    private func open(_ slot: CardSlot) {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) { opened = slot }
    }

    private func close() {
        var transaction = Transaction()
        transaction.disablesAnimations = true
        withTransaction(transaction) { opened = nil }
    }
}

/// One set: its name ("Thẻ khủng long"), its topic, "Đã có x/y", the grid of its cards and the
/// "+N" card of the lessons to come.
private struct CardSetSection: View {
    let set: CardSet
    let mode: LanguageMode
    let columns: Int
    let open: (CardSlot) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s10) {
            HStack(alignment: .firstTextBaseline, spacing: Tokens.Space.s8) {
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    Text(LocalizedStringKey(CollectibleSetName.key(for: set.set)))
                        .typography(Tokens.Typography.title)
                        .accessibilityAddTraits(.isHeader)
                    Text(verbatim: mode.name(set.topic.title))
                        .typography(Tokens.Typography.caption)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .fixedSize(horizontal: false, vertical: true)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                Text("cards.set.count \(set.earnedCount) \(set.cards.count)")
                    .typography(Tokens.Typography.caption)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize()
                    // "Đã có 2/5" would be read as a fraction or a date (content-editor 10/11).
                    .accessibilityLabel(Text("cards.count_a11y \(set.earnedCount) \(set.cards.count)"))
            }
            LazyVGrid(
                columns: Array(repeating: GridItem(.flexible(), spacing: CollectionMetrics.cardColumnGap, alignment: .top), count: columns),
                alignment: .leading,
                spacing: CollectionMetrics.cardRowGap
            ) {
                ForEach(Array(set.cards.enumerated()), id: \.element.id) { index, slot in
                    Group {
                        if slot.isEarned {
                            EarnedCardTile(slot: slot, mode: mode, tilt: index.isMultiple(of: 2) ? 1 : -1) { open(slot) }
                        } else {
                            HiddenCardTile(slot: slot)
                        }
                    }
                    // One id per lesson: two lessons may give the same card (tester 10/11 #8).
                    .accessibilityIdentifier("cards.card.\(set.id).\(slot.lessonNumber)")
                }
                if set.comingCount > 0 {
                    MoreCardsTile(count: set.comingCount)
                }
            }
            // Room for the chàm backing of the last column and the bottom row.
            .padding(.trailing, -CollectionMetrics.cardBackingInsets.trailing)
            .padding(.bottom, -CollectionMetrics.cardBackingInsets.bottom)
        }
        .accessibilityElement(children: .contain)
        .accessibilityIdentifier("cards.set.\(set.id)")
    }
}

/// A card won: its picture, its name and the name in the other language, on bright paper over a
/// tilted chàm backing. A button: it opens the card.
private struct EarnedCardTile: View {
    let slot: CardSlot
    let mode: LanguageMode
    /// 1 or −1: the backing leans one way or the other, alternately.
    let tilt: Double
    let action: () -> Void

    var body: some View {
        let card = slot.collectible
        let shape = RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous)
        Button(action: action) {
            VStack(spacing: Tokens.Space.s2) {
                ContentPicture(asset: card.image.asset, color: nil, size: CollectionMetrics.cardTileArt, box: .fillWidth)
                    .frame(maxWidth: .infinity, minHeight: CollectionMetrics.cardTileArt, maxHeight: CollectionMetrics.cardTileArt)
                    .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.sunken, cornerRadius: Tokens.Radius.discoverer)
                    .padding(.bottom, Tokens.Space.s4)
                Text(verbatim: mode.name(card.name))
                    .typography(Tokens.Typography.bodyStrong)
                    .lineLimit(2)
                    .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                if let second = mode.secondName(card.name) {
                    Text(verbatim: second)
                        .typography(Tokens.Typography.captionS)
                        .foregroundStyle(Tokens.Role.textSecondary)
                        .lineLimit(2)
                        .minimumScaleFactor(PaperMetrics.labelMinimumScale)
                }
                Spacer(minLength: 0)
            }
            .multilineTextAlignment(.center)
            .foregroundStyle(Tokens.Role.textPrimary)
            .padding(CollectionMetrics.cardTilePadding)
            .frame(maxWidth: .infinity, minHeight: CollectionMetrics.cardTileHeight)
            .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.paper2, in: shape)
            .background {
                RoundedRectangle(cornerRadius: Tokens.Radius.tileL, style: .continuous)
                    .fill(Tokens.Palette.cham)
                    .padding(CollectionMetrics.cardBackingInsets)
                    .rotationEffect(.degrees(CollectionMetrics.cardTilt.degrees * tilt))
                    .paperDropShadow(Tokens.Shadow.paper3)
            }
            .contentShape(shape)
        }
        .buttonStyle(.paperPress)
        .accessibilityLabel(Text("cards.card_a11y \(SpeechText.marked(mode.name(card.name), mode.nameLanguage))"))
    }
}

/// A card not won yet: dull paper pressed in, "?" and the lesson that gives it ("Bài 2").
private struct HiddenCardTile: View {
    let slot: CardSlot

    var body: some View {
        VStack(spacing: Tokens.Space.s4) {
            Text(verbatim: "?")
                .typography(Tokens.Typography.titleXl, fixedBox: true)
                .foregroundStyle(Tokens.Role.textSecondary)
            Text("cards.hidden \(slot.lessonNumber)")
                .typography(Tokens.Typography.captionS)
                .foregroundStyle(Tokens.Role.textSecondary)
                .lineLimit(2)
                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
        }
        .multilineTextAlignment(.center)
        .padding(CollectionMetrics.cardTilePadding)
        .frame(maxWidth: .infinity, minHeight: CollectionMetrics.cardTileHeight)
        .paperSurface(Tokens.Role.surfaceSunken, shadow: Tokens.Shadow.sunken, cornerRadius: Tokens.Radius.discoverer)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("cards.hidden_a11y \(slot.lessonNumber)"))
    }
}

/// "+N bài" "sắp có": the topic's lessons not written yet, a little stack of dull paper. Lessons,
/// not cards: a lesson may come without a card (content-editor 10/11 lượt 2); the noun is in the
/// big line, so it reads right in both languages (tester 10/11 #11).
private struct MoreCardsTile: View {
    let count: Int

    var body: some View {
        VStack(spacing: Tokens.Space.s4) {
            // "+3 LESSONS" is wider than a phone column at this size: two lines, then smaller.
            Text("cards.more \(count)")
                .typography(Tokens.Typography.titleL, fixedBox: true)
                .lineLimit(2)
                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
            Text("cards.more.caption")
                .typography(Tokens.Typography.captionS)
                .lineLimit(3)
                .minimumScaleFactor(PaperMetrics.labelMinimumScale)
        }
        .foregroundStyle(Tokens.Role.textSecondary)
        .multilineTextAlignment(.center)
        .padding(CollectionMetrics.cardTilePadding)
        .frame(maxWidth: .infinity, minHeight: CollectionMetrics.cardTileHeight)
        .paperSurface(Tokens.Role.surfaceInactive, shadow: Tokens.Shadow.paper2, cornerRadius: Tokens.Radius.discoverer)
        .background {
            RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous)
                .fill(Tokens.Palette.giayLomDeep)
                .padding(CollectionMetrics.moreBackingInsets)
                .rotationEffect(CollectionMetrics.moreTilt)
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(Text("cards.more_a11y \(count)"))
        .accessibilityIdentifier("cards.more")
    }
}

// MARK: - The open card

/// A card won, open over the tab (canvas dialog): the set's name and a close button, the big card
/// that turns over (`flip`; at once with Reduce Motion) between its front and "Em có biết?", a
/// listen button for the side shown.
private struct CardDetail: View {
    let slot: CardSlot
    let profile: ChildProfile
    let close: () -> Void

    @State private var flipped = false
    /// The side shown once the turn has ended (as on Thưởng): the far side's words leave the
    /// screen and VoiceOver only then.
    @State private var settledFlipped = false
    /// Height of the taller side's content at the card's width (`readingHeight`).
    @State private var faceHeight: CGFloat = 0
    @ReducedMotion private var reduced
    @Environment(\.layoutMetrics) private var metrics

    private var card: Collectible { slot.collectible }
    private var mode: LanguageMode { profile.languageMode }

    var body: some View {
        let scale = metrics.isRegular ? CollectionMetrics.detailRegularScale : 1
        let size = CGSize(width: CollectionMetrics.detailCardSize.width * scale, height: CollectionMetrics.detailCardSize.height * scale)
        GeometryReader { proxy in
            ScrollView(.vertical) {
                VStack(spacing: CollectionMetrics.detailGap) {
                    HStack(spacing: Tokens.Space.s12) {
                        Text(LocalizedStringKey(CollectibleSetName.key(for: card.set)))
                            .typography(Tokens.Typography.title)
                            .accessibilityAddTraits(.isHeader)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        PaperIconButton(.close, accessibilityLabel: Text("cards.detail.close"), action: close)
                            .accessibilityIdentifier("cards.detail.close")
                    }
                    Spacer(minLength: 0)
                    Button {
                        flipped.toggle()
                    } label: {
                        FlipCard(isFlipped: flipped) {
                            face(front: true, size: size)
                        } back: {
                            face(front: false, size: size)
                        }
                        .readingHeight(of: ZStack { frontContent; backContent }, into: $faceHeight)
                        .background {
                            RoundedRectangle(cornerRadius: Tokens.Radius.tileL, style: .continuous)
                                .fill(Tokens.Palette.cham)
                                .padding(CollectionMetrics.detailBackingInsets)
                                .rotationEffect(.degrees(CollectionMetrics.cardTilt.degrees * (flipped ? -1 : 1)))
                                .paperDropShadow(Tokens.Shadow.paper3)
                        }
                    }
                    .buttonStyle(.paperPress)
                    .accessibilityLabel(flipped
                        ? Text("cards.detail.back_a11y \(SpeechText.marked(mode.name(card.name), mode.nameLanguage))")
                        : Text("cards.detail.front_a11y \(SpeechText.marked(mode.name(card.name), mode.nameLanguage))"))
                    .accessibilityValue(flipped ? SpeechText.lines(card.fact, mode: mode) : Text(verbatim: ""))
                    .accessibilityIdentifier("cards.detail.card")
                    .motion(Tokens.Motion.Preset.pop)
                    .task(id: flipped) {
                        if !reduced { try? await Task.sleep(for: .seconds(Tokens.Motion.Preset.flip.duration)) }
                        if !Task.isCancelled { settledFlipped = flipped }
                    }
                    HStack(spacing: Tokens.Space.s12) {
                        ListenButton(
                            flipped
                                ? Utterance(id: "cards.fact", [card.fact], voice: profile.voiceMode)
                                : Utterance(id: "cards.card", [card.name, card.tag], voice: profile.voiceMode),
                            label: flipped ? "lesson.listen.fact" : "lesson.listen.card",
                            disc: .paper
                        )
                        HStack(spacing: Tokens.Space.s8) {
                            PaperIconView(.retry, size: CollectionMetrics.chipIcon)
                            Text("cards.detail.hint")
                                .typography(Tokens.Typography.bodyStrong)
                        }
                        .accessibilityHidden(true)
                    }
                    .reveal(order: 3)
                    Spacer(minLength: 0)
                }
                .padding(metrics.contentInsets)
                .frame(maxWidth: CollectionMetrics.columnMaxWidth)
                .frame(maxWidth: .infinity, minHeight: proxy.size.height)
            }
            .scrollBounceBehavior(.basedOnSize)
        }
        .foregroundStyle(Tokens.Role.textPrimary)
        .accessibilityIdentifier("cards.detail")
    }

    /// One side of the card, `height` tall (the taller side's content, at least the canvas's 400,
    /// `faceHeight`), so the two sides always match whatever the text size.
    private func face(front: Bool, size: CGSize) -> some View {
        let shape = RoundedRectangle(cornerRadius: Tokens.Radius.discoverer, style: .continuous)
        let showsContent = front ? (!flipped || !settledFlipped) : (flipped || settledFlipped)
        // The side facing away has no content at all once the turn is over, so its words are in
        // no accessibility tree or audit (tester 10/11 #17); its height comes from `faceHeight`.
        return Group {
            if showsContent {
                if front { frontContent } else { backContent }
            }
        }
        .frame(width: size.width, height: max(size.height, faceHeight), alignment: .topLeading)
        .paperSurface(Tokens.Role.surfacePaper, shadow: Tokens.Shadow.onDark, in: shape)
    }

    private var frontContent: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s10) {
            if let tag = card.tag {
                PaperTag(Text(verbatim: mode.name(tag)), style: .chip(dot: Tokens.Palette.cham))
            }
            ContentPicture(asset: card.image.asset, color: Tokens.Palette.giDong, size: CollectionMetrics.detailArtPicture,
                           accessibilityLabel: Text(SpeechText.marked(card.image.alt.text(in: mode.nameLanguage), mode.nameLanguage)))
                .frame(maxWidth: .infinity, minHeight: CollectionMetrics.detailArt)
                .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.sunken, cornerRadius: Tokens.Radius.discoverer)
            Text(verbatim: mode.name(card.name))
                .typography(Tokens.Typography.titleXl)
                .fixedSize(horizontal: false, vertical: true)
            if let second = mode.secondName(card.name) {
                Text(verbatim: second)
                    .typography(Tokens.Typography.itemTitle)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
            HStack {
                Text(LocalizedStringKey(CollectibleSetName.key(for: card.set)))
                    + Text(verbatim: " · ") + Text("cards.detail.front")
            }
            .typography(Tokens.Typography.captionS)
            .foregroundStyle(Tokens.Role.textSecondary)
        }
        .padding(CollectionMetrics.detailFrontPadding)
    }

    private var backContent: some View {
        VStack(alignment: .leading, spacing: Tokens.Space.s14) {
            PaperTag(Text("lesson.reward.fact"), style: .cut())
            HStack(spacing: Tokens.Space.s12) {
                ContentPicture(asset: card.image.asset, color: nil, size: CollectionMetrics.detailBackArtPicture)
                    .frame(width: CollectionMetrics.detailBackArt, height: CollectionMetrics.detailBackArt)
                    .paperSurface(Tokens.Role.bgScreen, shadow: Tokens.Shadow.sunken, in: Circle())
                    .clipShape(Circle())
                    .accessibilityHidden(true)
                VStack(alignment: .leading, spacing: Tokens.Space.s2) {
                    Text(verbatim: mode.name(card.name))
                        .typography(Tokens.Typography.titleL)
                        .fixedSize(horizontal: false, vertical: true)
                    if let second = mode.secondName(card.name) {
                        Text(verbatim: second)
                            .typography(Tokens.Typography.caption)
                            .foregroundStyle(Tokens.Role.textSecondary)
                    }
                }
            }
            Text(verbatim: mode.sentence(card.fact))
                .typography(Tokens.Typography.sentence)
                .fixedSize(horizontal: false, vertical: true)
            if !mode.hidesSentenceSecondLanguage {
                Text(verbatim: mode.secondSentence(card.fact))
                    .typography(Tokens.Typography.body)
                    .foregroundStyle(Tokens.Role.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
            Spacer(minLength: 0)
            if let tag = card.tag {
                PaperTag(Text(verbatim: mode.name(tag)), style: .chip(dot: Tokens.Palette.cham))
            }
        }
        .padding(CollectionMetrics.detailBackPadding)
    }
}
