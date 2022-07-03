import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NestedWrapper test', () {
    testWidgets('initial load', (tester) async {
      const widget = NestedWrapper(
        title: 'title',
        body: Text('body'),
      );

      const app = MaterialApp(
        home: Material(child: widget),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.text('title'), findsOneWidget);
      expect(find.text('body'), findsOneWidget);
    });
  });
}
