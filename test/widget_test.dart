import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:challenge2/main.dart';

void main() {
  testWidgets('luxury shell shows agent identity and mission', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const EstateAgentPortfolioApp());
    await tester.pumpAndSettle();

    expect(find.text('Jordan Mercer'), findsWidgets);
    expect(find.textContaining('Mission statement'), findsOneWidget);
    expect(find.textContaining('Featured successes'), findsOneWidget);
  });

  testWidgets('stats tab shows performance snapshot', (WidgetTester tester) async {
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const EstateAgentPortfolioApp());
    await tester.pumpAndSettle();

    await tester.tap(find.text('Stats'));
    await tester.pumpAndSettle();

    expect(find.text('Performance snapshot'), findsOneWidget);
    expect(find.textContaining('EXPERIENCE'), findsOneWidget);
  });
}
