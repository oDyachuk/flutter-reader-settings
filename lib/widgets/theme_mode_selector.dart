import 'package:flutter/material.dart';

/// Перемикач режиму теми: світла / темна / як у системі.
class ThemeModeSelector extends StatelessWidget {
  const ThemeModeSelector({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final ThemeMode value;
  final ValueChanged<ThemeMode> onChanged;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<ThemeMode>(
      showSelectedIcon: false,
      segments: const [
        ButtonSegment<ThemeMode>(
          value: ThemeMode.light,
          label: Text('Світла'),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.dark,
          label: Text('Темна'),
        ),
        ButtonSegment<ThemeMode>(
          value: ThemeMode.system,
          label: Text('Як у системі'),
        ),
      ],
      selected: {value},
      onSelectionChanged: (selection) => onChanged(selection.first),
    );
  }
}
