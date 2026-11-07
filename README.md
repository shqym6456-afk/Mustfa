# VYORA — Phase 2A: project foundation

## What is in this phase
- Theme: light and dark, built from the Phase 1 brand colours
- Arabic (RTL) and English (LTR) through `flutter gen-l10n`
- Navigation: splash, then 5 tabs (go_router)
- Settings state (theme mode and language) saved on the device
- Free plan limits (5 goals, 10 AI messages a day) as constants
- Screens are honest placeholders. No fake data.

## Folder layout
```
lib/
  main.dart                    entry point
  app.dart                     MaterialApp.router, theme, locale
  core/
    theme/                     colours and ThemeData
    router/                    routes
    settings/                  theme and language state
    entitlements/              free plan limits
    widgets/                   shared widgets (logo)
  features/
    splash/  shell/            one folder per feature from here on
  l10n/                        app_ar.arb, app_en.arb
```

## Run it
1. Install Flutter (stable): https://docs.flutter.dev/get-started/install
2. Create the platform folders in an empty directory, then copy these files over it:
   `flutter create --org com.yourcompany --project-name vyora .`
   (choose your own organisation id; it becomes the Android/iOS app id and cannot be changed easily after publishing)
3. Replace `pubspec.yaml`, `analysis_options.yaml`, `l10n.yaml`, `lib/` and `test/` with the ones in this folder.
4. `flutter pub get`
5. `flutter gen-l10n`
6. `flutter analyze`
7. `flutter test`
8. `flutter run`

If a dependency version is rejected, run `flutter pub upgrade --major-versions`.
If `app_localizations.dart` is generated in a different folder, adjust the
`import '.../l10n/app_localizations.dart'` lines to the path printed by `gen-l10n`.

## Done when
- `flutter analyze` shows no errors
- `flutter test` passes (5 tests)
- The app opens on the splash, then the 5 tabs; the language follows the phone (Arabic is RTL)
