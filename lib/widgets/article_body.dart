import 'package:flutter/material.dart';

import '../models/sample_article.dart';
import '../state/text_scope.dart';

/// Довгий текст. Етап 2: єдиний віджет, що залежить від `TextScope`.
class ArticleBody extends StatelessWidget {
  const ArticleBody({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: ArticleBody');
    final fontSize = TextScope.of(context).fontSize;
    final textTheme = Theme.of(context).textTheme;
    final bodyStyle =
        textTheme.bodyLarge?.copyWith(fontSize: fontSize, height: 1.6);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Text(kArticleTitle, style: textTheme.headlineSmall),
        const SizedBox(height: 16),
        for (final paragraph in kArticleParagraphs) ...[
          Text(paragraph, style: bodyStyle),
          const SizedBox(height: 12),
        ],
      ],
    );
  }
}
