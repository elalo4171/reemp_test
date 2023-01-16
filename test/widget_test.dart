// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:reemp/main.dart';

void main() {
  testWidgets('Expect run app', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text('2/5'), findsOneWidget);
  });

  testWidgets('Expect select option', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.tap(find.byKey(const Key("car")));
    var btn = tester.firstWidget<ElevatedButton>(find.byKey(const Key('next')));
    expect(btn.enabled, true);
  });
}
