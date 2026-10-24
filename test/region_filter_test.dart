import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:archaeology_app/main.dart';

void main() {
  testWidgets('region chips filter the site list',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pumpAndSettle();

    await tester.tap(find.text('SITE LIST'));
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();

    expect(find.text('Troy'), findsOneWidget);
    expect(find.text('Ephesus'), findsOneWidget);

    await tester.tap(find.text('Aegean'));
    await tester.pumpAndSettle();
    expect(find.text('Ephesus'), findsOneWidget);
    expect(find.text('Troy'), findsNothing,
        reason: 'Troy is in Marmara and must be filtered out');

    await tester.tap(find.text('All'));
    await tester.pumpAndSettle();
    expect(find.text('Troy'), findsOneWidget);
  });
}
