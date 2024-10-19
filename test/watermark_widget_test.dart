import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:watermark_widget/watermark_widget.dart';

void main() {
  testWidgets('WatermarkWidget renders child widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WatermarkWidget(
          text: 'TEST',
          child: Container(
            color: Colors.blue,
            child: const Text('Child Widget'),
          ),
        ),
      ),
    );

    expect(find.text('Child Widget'), findsOneWidget);
  });

  testWidgets('WatermarkWidget renders at least one CustomPaint',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WatermarkWidget(
          text: 'WATERMARK',
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );

    expect(find.byType(CustomPaint), findsAtLeastNWidgets(1));
  });

  testWidgets('WatermarkWidget applies correct structure',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WatermarkWidget(
          text: 'TEST',
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );

    expect(find.byType(Stack), findsOneWidget);
    expect(find.byType(Positioned), findsOneWidget);
    expect(find.byType(ClipRect), findsOneWidget);
    expect(find.byType(CustomPaint), findsAtLeastNWidgets(1));
  });

  testWidgets('WatermarkWidget updates when properties change',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: WatermarkWidget(
          text: 'Initial',
          opacity: 0.5,
          color: Colors.red,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );

    final initialCustomPaints =
        tester.widgetList<CustomPaint>(find.byType(CustomPaint)).toList();

    await tester.pumpWidget(
      MaterialApp(
        home: WatermarkWidget(
          text: 'Updated',
          opacity: 0.7,
          color: Colors.green,
          child: Container(
            width: 300,
            height: 300,
            color: Colors.blue,
          ),
        ),
      ),
    );

    final updatedCustomPaints =
        tester.widgetList<CustomPaint>(find.byType(CustomPaint)).toList();

    // Verify that the number of CustomPaint widgets hasn't changed
    expect(updatedCustomPaints.length, equals(initialCustomPaints.length));

    // Verify that at least one CustomPaint widget has been updated
    expect(
        updatedCustomPaints.any((updated) => initialCustomPaints
            .every((initial) => initial.painter != updated.painter)),
        isTrue);
  });
}
