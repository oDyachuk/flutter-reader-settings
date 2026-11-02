import 'package:flutter/material.dart';

import '../models/sample_article.dart';
import '../state/app_theme.dart';

/// Попередній перегляд: показує текст у ще не застосованій темі
/// та з ще не застосованим розміром шрифту.
class SettingsPreview extends StatelessWidget {
  const SettingsPreview({
    super.key,
    required this.themeMode,
    required this.seed,
    required this.fontSize,
  });

  final ThemeMode themeMode;
  final Color seed;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    debugPrint('build: SettingsPreview');
    final brightness = switch (themeMode) {
      ThemeMode.light => Brightness.light,
      ThemeMode.dark => Brightness.dark,
      ThemeMode.system => MediaQuery.platformBrightnessOf(context),
    };

    return Theme(
      data: buildTheme(seed, brightness),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final scheme = theme.colorScheme;
          return Material(
            color: scheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: scheme.outlineVariant),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kArticleTitle,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: scheme.primary),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    kArticleParagraphs.first,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      fontSize: fontSize,
                      height: 1.5,
                      color: scheme.onSurface,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
