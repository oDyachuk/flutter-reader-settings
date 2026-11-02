import 'package:flutter/widgets.dart';

import 'text_settings_model.dart';

/// Надає [TextSettingsModel] усьому дереву нижче.
class TextScope extends InheritedNotifier<TextSettingsModel> {
  const TextScope({
    super.key,
    required TextSettingsModel super.notifier,
    required super.child,
  });

  /// Повертає модель і підписує [context] на її зміни.
  static TextSettingsModel of(BuildContext context) {
    final scope = context.dependOnInheritedWidgetOfExactType<TextScope>();
    assert(scope != null, 'TextScope не знайдено над цим контекстом');
    return scope!.notifier!;
  }

  /// Повертає модель без підписки (для обробників подій та `initState`).
  static TextSettingsModel read(BuildContext context) {
    final scope = context.getInheritedWidgetOfExactType<TextScope>();
    assert(scope != null, 'TextScope не знайдено над цим контекстом');
    return scope!.notifier!;
  }
}
