import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:archaeology_app/main.dart';

void main() {
  testWidgets('app boots into the splash screen', (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pumpAndSettle();

    expect(find.text('ARCHAEOLOGY APP'), findsOneWidget);
  });

  testWidgets('language choice survives an app restart',
      (WidgetTester tester) async {
    SharedPreferences.setMockInitialValues({});
    final prefs = await SharedPreferences.getInstance();

    await tester.pumpWidget(MyApp(prefs: prefs));
    await tester.pumpAndSettle();
    expect(find.text('ARCHAEOLOGY APP'), findsOneWidget);

    await tester.tap(find.text('TR'));
    // Advance the fake clock past AppClickable's tap feedback delay, then
    // settle the frames the locale change schedules.
    await tester.pump(const Duration(milliseconds: 200));
    await tester.pumpAndSettle();
    expect(find.text('ARKEOLOJI UYGULAMASI'), findsOneWidget);

    // Simulate a restart: rebuild the app against the same preference store.
    final restarted = await SharedPreferences.getInstance();
    await tester.pumpWidget(MyApp(prefs: restarted));
    await tester.pumpAndSettle();
    expect(find.text('ARKEOLOJI UYGULAMASI'), findsOneWidget);
    expect(find.text('ARCHAEOLOGY APP'), findsNothing);
  });
}
