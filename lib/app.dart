import 'package:flutter/material.dart';

import 'screens/reading_screen.dart';
import 'state/app_theme.dart';
import 'state/text_scope.dart';
import 'state/text_settings_model.dart';
import 'state/theme_scope.dart';
import 'state/theme_settings_model.dart';

/// Етап 2: віджет володіє двома моделями, створює й звільняє їх,
/// а нижче по дереву вони доступні через `ThemeScope` і `TextScope`.
class ReaderApp extends StatefulWidget {
  const ReaderApp({super.key});

  @override
  State<ReaderApp> createState() => _ReaderAppState();
}

class _ReaderAppState extends State<ReaderApp> {
  final ThemeSettingsModel _theme = ThemeSettingsModel();
  final TextSettingsModel _text = TextSettingsModel();

  @override
  void dispose() {
    _theme.dispose();
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('build: ReaderApp');
    return TextScope(
      notifier: _text,
      child: ThemeScope(
        notifier: _theme,
        child: const _ThemedApp(),
      ),
    );
  }
}

/// `MaterialApp` залежить лише від `ThemeScope`: зміна розміру шрифту
/// його не перебудовує.
class _ThemedApp extends StatelessWidget {
  const _ThemedApp();

  @override
  Widget build(BuildContext context) {
    debugPrint('build: MaterialApp (_ThemedApp)');
    final settings = ThemeScope.of(context);
    final seed = settings.accent.seed;
    return MaterialApp(
      title: 'Читанка',
      theme: buildTheme(seed, Brightness.light),
      darkTheme: buildTheme(seed, Brightness.dark),
      themeMode: settings.themeMode,
      home: const ReadingScreen(),
    );
  }
}
