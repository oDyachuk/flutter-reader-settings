import 'package:flutter/material.dart';

import '../models/accent_option.dart';
import '../models/text_settings.dart';
import '../models/theme_settings.dart';
import '../state/text_scope.dart';
import '../state/theme_scope.dart';
import '../widgets/accent_picker.dart';
import '../widgets/settings_preview.dart';
import '../widgets/theme_mode_selector.dart';

/// Екран налаштувань. Етап 2: без параметрів.
///
/// Застосовані значення читаються зі scope-ів лише в `initState` та
/// обробниках (`read`, без підписки). Ефемерний стан — чернетка режиму й
/// акценту та значення слайдера під час перетягування — лишається в
/// `setState`.
class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late ThemeMode _mode;
  late AccentOption _accent;
  late double _fontSize;

  @override
  void initState() {
    super.initState();
    final theme = ThemeScope.read(context).value;
    final text = TextScope.read(context).value;
    _mode = theme.themeMode;
    _accent = theme.accent;
    _fontSize = text.fontSize;
  }

  void _applyTheme() {
    ThemeScope.read(context).apply(themeMode: _mode, accent: _accent);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Тему застосовано')),
    );
  }

  void _applyFontSize(double value) {
    TextScope.read(context).setFontSize(value);
  }

  void _reset() {
    ThemeScope.read(context).reset();
    TextScope.read(context).reset();
    const defaultTheme = ThemeSettings();
    setState(() {
      _mode = defaultTheme.themeMode;
      _accent = defaultTheme.accent;
      _fontSize = TextSettings.defaultFontSize;
    });
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build: SettingsScreen');
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return Scaffold(
      appBar: AppBar(title: const Text('Налаштування')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text('Попередній перегляд', style: titleStyle),
          const SizedBox(height: 8),
          SettingsPreview(
            themeMode: _mode,
            seed: _accent.seed,
            fontSize: _fontSize,
          ),
          const SizedBox(height: 24),
          Text('Режим теми', style: titleStyle),
          const SizedBox(height: 8),
          ThemeModeSelector(
            value: _mode,
            onChanged: (mode) => setState(() => _mode = mode),
          ),
          const SizedBox(height: 16),
          Text('Колір акценту', style: titleStyle),
          const SizedBox(height: 8),
          AccentPicker(
            selected: _accent,
            onSelected: (accent) => setState(() => _accent = accent),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              onPressed: _applyTheme,
              icon: const Icon(Icons.check),
              label: const Text('Застосувати тему'),
            ),
          ),
          const Divider(height: 32),
          Text('Розмір шрифту: ${_fontSize.round()}', style: titleStyle),
          Slider(
            value: _fontSize,
            min: TextSettings.minFontSize,
            max: TextSettings.maxFontSize,
            divisions: 12,
            label: _fontSize.round().toString(),
            onChanged: (value) => setState(() => _fontSize = value),
            onChangeEnd: _applyFontSize,
          ),
          Text(
            'Розмір застосовується, коли ви відпускаєте повзунок.',
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 24),
          OutlinedButton.icon(
            onPressed: _reset,
            icon: const Icon(Icons.restart_alt),
            label: const Text('Скинути до типових'),
          ),
        ],
      ),
    );
  }
}
