import 'package:flutter/foundation.dart';

/// Незмінні налаштування тексту: розмір шрифту.
@immutable
class TextSettings {
  const TextSettings({this.fontSize = TextSettings.defaultFontSize});

  static const double minFontSize = 12;
  static const double maxFontSize = 24;
  static const double defaultFontSize = 16;

  final double fontSize;

  TextSettings copyWith({double? fontSize}) {
    return TextSettings(fontSize: fontSize ?? this.fontSize);
  }

  @override
  bool operator ==(Object other) =>
      other is TextSettings && other.fontSize == fontSize;

  @override
  int get hashCode => fontSize.hashCode;
}
