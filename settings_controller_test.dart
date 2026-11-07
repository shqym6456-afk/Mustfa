import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vyora/core/entitlements/free_tier_limits.dart';
import 'package:vyora/core/settings/settings_controller.dart';

Future<ProviderContainer> _container(Map<String, Object> initial) async {
  SharedPreferences.setMockInitialValues(initial);
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [sharedPreferencesProvider.overrideWithValue(prefs)],
  );
  addTearDown(container.dispose);
  return container;
}

void main() {
  test('defaults: follow system theme and device language', () async {
    final c = await _container({});
    final s = c.read(settingsProvider);
    expect(s.themeMode, ThemeMode.system);
    expect(s.locale, isNull);
  });

  test('theme mode is saved and restored', () async {
    final c = await _container({});
    await c.read(settingsProvider.notifier).setThemeMode(ThemeMode.dark);
    expect(c.read(settingsProvider).themeMode, ThemeMode.dark);

    final restored = await _container({'settings.themeMode': 'dark'});
    expect(restored.read(settingsProvider).themeMode, ThemeMode.dark);
  });

  test('locale can be set to Arabic and reset to device language', () async {
    final c = await _container({});
    final notifier = c.read(settingsProvider.notifier);

    await notifier.setLocale(const Locale('ar'));
    expect(c.read(settingsProvider).locale, const Locale('ar'));

    await notifier.setLocale(null);
    expect(c.read(settingsProvider).locale, isNull);
  });

  test('an unknown saved locale is ignored', () async {
    final c = await _container({'settings.locale': 'fr'});
    expect(c.read(settingsProvider).locale, isNull);
  });

  test('free tier limits match the agreed plan', () {
    expect(FreeTierLimits.maxGoals, 5);
    expect(FreeTierLimits.maxAiMessagesPerDay, 10);
  });
}
