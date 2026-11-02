import 'package:flutter_test/flutter_test.dart';
import 'package:reader_settings/app.dart';

void main() {
  testWidgets('відкриває екран налаштувань з екрана читання', (tester) async {
    await tester.pumpWidget(const ReaderApp());
    expect(find.text('Читанка'), findsOneWidget);

    await tester.tap(find.byTooltip('Налаштування'));
    await tester.pumpAndSettle();

    expect(find.text('Попередній перегляд'), findsOneWidget);
  });
}
