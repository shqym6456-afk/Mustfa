import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Overridden in main() with the real instance.
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (ref) => throw UnimplementedError('sharedPreferencesProvider not overridden'),
);

@immutable
class SettingsState {
  const SettingsState({this.themeMode = ThemeMode.system, this.locale});

  final ThemeMode themeMode;

  /// null means "follow the device language".
  final Locale? locale;
}

class SettingsController extends Notifier<SettingsState> {
  static const _themeKey = 'settings.themeMode';
  static const _localeKey = 'settings.locale';

  @override
  SettingsState build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    final themeName = prefs.getString(_themeKey);
    final code = prefs.getString(_localeKey);

    return SettingsState(
      themeMode: ThemeMode.values.firstWhere(
        (m) => m.name == themeName,
        orElse: () => ThemeMode.system,
      ),
      locale: (code == 'ar' || code == 'en') ? Locale(code!) : null,
    );
  }

  Future<void> setThemeMode(ThemeMode mode) async {
    state = SettingsState(themeMode: mode, locale: state.locale);
    await ref.read(sharedPreferencesProvider).setString(_themeKey, mode.name);
  }

  /// Pass null to follow the device language.
  Future<void> setLocale(Locale? locale) async {
    state = SettingsState(themeMode: state.themeMode, locale: locale);
    final prefs = ref.read(sharedPreferencesProvider);
    if (locale == null) {
      await prefs.remove(_localeKey);
    } else {
      await prefs.setString(_localeKey, locale.languageCode);
    }
  }
}

final settingsProvider =
    NotifierProvider<SettingsController, SettingsState>(SettingsController.new);
