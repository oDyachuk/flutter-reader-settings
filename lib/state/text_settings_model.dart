import 'package:flutter/foundation.dart';

import '../models/text_settings.dart';

/// Спільний стан тексту (розмір шрифту). Від нього залежить лише екран читання.
class TextSettingsModel extends ChangeNotifier {
  TextSettings _value = const TextSettings();

  TextSettings get value => _value;
  double get fontSize => _value.fontSize;

  void setFontSize(double fontSize) {
    final clamped = fontSize
        .clamp(TextSettings.minFontSize, TextSettings.maxFontSize)
        .toDouble();
    if (clamped == _value.fontSize) return;
    _value = _value.copyWith(fontSize: clamped);
    notifyListeners();
  }

  void reset() {
    const defaults = TextSettings();
    if (_value == defaults) return;
    _value = defaults;
    notifyListeners();
  }
}
