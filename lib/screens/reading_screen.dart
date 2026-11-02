import 'package:flutter/material.dart';

import '../widgets/article_body.dart';
import 'settings_screen.dart';

/// Екран читання. Етап 2: без параметрів — стан береться зі scope-ів
/// там, де він потрібен (`ArticleBody`).
class ReadingScreen extends StatelessWidget {
  const ReadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    debugPrint('build: ReadingScreen');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Читанка'),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune),
            tooltip: 'Налаштування',
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (_) => const SettingsScreen(),
              ),
            ),
          ),
        ],
      ),
      body: const ArticleBody(),
    );
  }
}
