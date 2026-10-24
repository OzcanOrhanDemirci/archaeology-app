import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:archaeology_app/main.dart';
import 'package:archaeology_app/screens/glossary_screen.dart';
import 'package:archaeology_app/screens/home_screen.dart';
import 'package:archaeology_app/screens/settings_screen.dart';

void main() {
  Future<void> tapAndSettle(WidgetTester tester, Finder finder) async {
    await tester.tap(finder);
    // AppClickable runs its callback after a 150 ms feedback delay.
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();
  }

  testWidgets('drawer navigation keeps the stack at root plus one screen',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();
    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pumpAndSettle();

    await tapAndSettle(tester, find.text('SITE LIST'));
    expect(find.byType(HomeScreen), findsOneWidget);

    // Repeatedly opening screens from the drawer must not pile routes up.
    await tapAndSettle(tester, find.byIcon(Icons.menu));
    await tapAndSettle(tester, find.text('Glossary'));
    expect(find.byType(GlossaryScreen), findsOneWidget);
    expect(find.byType(HomeScreen), findsNothing);
    // The splash root is kept, so system back still has somewhere to go.
    expect(find.byType(SettingsScreen), findsNothing);

    await tapAndSettle(tester, find.byIcon(Icons.menu));
    await tapAndSettle(tester, find.text('Settings'));
    expect(find.byType(SettingsScreen), findsOneWidget);
    expect(find.byType(GlossaryScreen), findsNothing);
  });
}
