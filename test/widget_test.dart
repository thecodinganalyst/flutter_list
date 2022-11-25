// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_list/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    final itemList = List<ListItem>.generate(
        200,
            (i) => i % 6 == 0
            ? HeadingItem('Header $i')
            : MessageItem('Sender $i', 'Message body $i')
    );
    await tester.pumpWidget(MyApp(items: itemList,));

    final listFinder = find.byType(Scrollable);
    final itemFinder = find.byKey(const ValueKey("199"));

    await tester.scrollUntilVisible(itemFinder, 500.0, scrollable: listFinder);

    expect(itemFinder, findsOneWidget);

  });
}
