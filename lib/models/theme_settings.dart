import 'package:flutter/material.dart';

import 'accent_option.dart';

/// Незмінні налаштування теми: режим і акцентний колір.
@immutable
class ThemeSettings {
  const ThemeSettings({
    this.themeMode = ThemeMode.system,
    this.accent = kDefaultAccent,
  });

  final ThemeMode themeMode;
  final AccentOption accent;

  ThemeSettings copyWith({ThemeMode? themeMode, AccentOption? accent}) {
    return ThemeSettings(
      themeMode: themeMode ?? this.themeMode,
      accent: accent ?? this.accent,
    );
  }

  @override
  bool operator ==(Object other) =>
      other is ThemeSettings &&
      other.themeMode == themeMode &&
      other.accent == accent;

  @override
  int get hashCode => Object.hash(themeMode, accent);
}
