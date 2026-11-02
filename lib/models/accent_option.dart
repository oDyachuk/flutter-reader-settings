import 'package:flutter/material.dart';

/// Варіант акцентного кольору: назва і базовий колір для
/// `ColorScheme.fromSeed`.
@immutable
class AccentOption {
  const AccentOption(this.name, this.seed);

  final String name;
  final Color seed;
}

const AccentOption kDefaultAccent = AccentOption('Індиго', Colors.indigo);

const List<AccentOption> kAccentOptions = [
  kDefaultAccent,
  AccentOption('Смарагд', Colors.teal),
  AccentOption('Бурштин', Colors.amber),
  AccentOption('Корал', Colors.deepOrange),
  AccentOption('Ягода', Colors.pink),
  AccentOption('Небо', Colors.lightBlue),
];
