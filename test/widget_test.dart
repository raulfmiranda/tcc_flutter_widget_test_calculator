import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:tcc_widget_test_calc/main.dart';

void main() {
  testWidgets('Sum smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that sum result starts at 0.0
    expect(find.text('0.0'), findsOneWidget);
    expect(find.text('7.0'), findsNothing);

    // Set 3.0 and 4.0 in first and second inputs
    await tester.enterText(find.byKey(Key('firstInput')), '3.0');
    await tester.enterText(find.byKey(Key('secondInput')), '4.0');

    // Tap the SUM button and trigger a frame.
    await tester.tap(find.text('SUM'));
    await tester.pump();

    // Verify if the sum have been done correctly
    expect(find.text('0.0'), findsNothing);
    expect(find.text('7.0'), findsOneWidget);
  });
}
