import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CenterText', () {
    testWidgets('text should be test', (tester) async {
      const widget = CenterText('test');

      const app = MaterialApp(
        home: Material(child: widget),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.text('test'), findsOneWidget);
    });
  });
}
