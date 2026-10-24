import 'package:flutter_test/flutter_test.dart';

import 'package:archaeology_app/main.dart';

void main() {
  testWidgets('app boots into the splash screen', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('ARCHAEOLOGY APP'), findsOneWidget);
  });
}
