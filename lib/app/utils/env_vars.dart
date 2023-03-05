abstract class EnvVars {
  static bool get crashlyticsEnabled => const bool.fromEnvironment("CRASHLYTICS_ENABLED", defaultValue: false);
  static bool get previewEnabled => const bool.fromEnvironment("PREVIEW_ENABLED", defaultValue: false);
}
