import 'package:flutter/material.dart';

import '../models/accent_option.dart';

/// Вибір акцентного кольору (чипи з кольоровою позначкою).
class AccentPicker extends StatelessWidget {
  const AccentPicker({
    super.key,
    required this.selected,
    required this.onSelected,
  });

  final AccentOption selected;
  final ValueChanged<AccentOption> onSelected;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: [
        for (final option in kAccentOptions)
          ChoiceChip(
            avatar: CircleAvatar(backgroundColor: option.seed),
            label: Text(option.name),
            showCheckmark: false,
            selected: option == selected,
            onSelected: (_) => onSelected(option),
          ),
      ],
    );
  }
}
