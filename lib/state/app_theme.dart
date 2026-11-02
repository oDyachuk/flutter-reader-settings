import 'package:flutter/material.dart';

/// Єдине місце, де будується тема: кольори лише через `ColorScheme.fromSeed`.
ThemeData buildTheme(Color seed, Brightness brightness) {
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: seed,
      brightness: brightness,
    ),
  );
}
