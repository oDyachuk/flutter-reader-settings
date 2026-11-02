import 'package:flutter/material.dart';

import '../models/accent_option.dart';
import '../models/theme_settings.dart';

/// Спільний стан теми (режим + акцент). Від нього залежить `MaterialApp`.
class ThemeSettingsModel extends ChangeNotifier {
  ThemeSettings _value = const ThemeSettings();

  ThemeSettings get value => _value;
  ThemeMode get themeMode => _value.themeMode;
  AccentOption get accent => _value.accent;

  void apply({required ThemeMode themeMode, required AccentOption accent}) {
    final next = _value.copyWith(themeMode: themeMode, accent: accent);
    if (next == _value) return;
    _value = next;
    notifyListeners();
  }

  void reset() {
    const defaults = ThemeSettings();
    if (_value == defaults) return;
    _value = defaults;
    notifyListeners();
  }
}
