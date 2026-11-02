/// `Sync` (SK-022) is the app's only network code: guest session (supabase-swift Auth, Keychain),
/// `create_child_profile`, the offline queue of `submit_attempts`, `get_home`.
public enum SyncModule {
    public static let name = "Sync"
}
