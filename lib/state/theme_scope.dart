import 'package:flutter/widgets.dart';

import 'theme_settings_model.dart';

/// Надає [ThemeSettingsModel] усьому дереву нижче (над `MaterialApp`).
class ThemeScope extends InheritedNotifier<ThemeSettingsModel> {
  const ThemeScope({
    super.key,
    required ThemeSettingsModel super.notifier,
    required super.child,
  });

  /// Повертає модель і підписує [context] на її зміни.
  static ThemeSettingsModel of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<ThemeScope>();
    assert(scope != null, 'ThemeScope не знайдено над цим контекстом');
    return scope!.notifier!;
  }

  /// Повертає модель без підписки (для обробників подій та `initState`).
  static ThemeSettingsModel read(BuildContext context) {
    final scope = context.getInheritedWidgetOfExactType<ThemeScope>();
    assert(scope != null, 'ThemeScope не знайдено над цим контекстом');
    return scope!.notifier!;
  }
}
