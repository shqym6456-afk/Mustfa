/// Limits of the free plan. Premium ($2/month) removes them.
///
/// IMPORTANT: these constants only drive the UI. The real enforcement must
/// also live on the server (Supabase RLS policies / edge function), because
/// anything checked only in the app can be bypassed. That is built in the
/// Supabase phase.
abstract final class FreeTierLimits {
  static const int maxGoals = 5;
  static const int maxAiMessagesPerDay = 10;
}
