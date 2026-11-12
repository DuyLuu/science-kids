import ContentModel

/// Switches of the trial build, in one place (SK-030).
enum AppFeatures {
    /// The paid plan is off for now (syllabus.md section 9, Duy 9/11): every lesson is open and no
    /// "Miễn phí" tag shows (`topic.free` on Topic, `home.continue_free` on the Home card). Set it
    /// back to `true` with the paywall; the tags then follow each topic's `is_free` again.
    static let paidPlanEnabled = false

    /// The world every screen takes its look from (`\.ageGroup`: corner radius, touch target):
    /// only the Discoverer canvas exists, and only Discoverer has written lessons. The profile
    /// screen tells the parents of other worlds that the child tries it (B18 #14). Home itself
    /// opens on the profile's own world and shows the other two on request (SK-030).
    static let trialWorld: Topic.AgeGroup = .discoverer
}
