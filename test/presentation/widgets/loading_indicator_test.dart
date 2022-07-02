import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoadingIndicator', () {
    testWidgets('initial load', (tester) async {
      const widget = LoadingIndicator();

      const app = MaterialApp(
        home: Material(child: widget),
      );

      await tester.pumpWidget(app);
      await tester.pump();
    });

    testWidgets('all data is filled', (tester) async {
      const widget = LoadingIndicator(
        strokeWidth: 1,
        size: 1,
        color: Colors.red,
      );

      const app = MaterialApp(
        home: Material(child: widget),
      );

      await tester.pumpWidget(app);
      await tester.pump();

      final sizedBox = find
        .byType(SizedBox)
        .evaluate().single.widget as SizedBox; 

      final circularProgress = find
        .byType(CircularProgressIndicator)
        .evaluate().single.widget as CircularProgressIndicator; 

      expect(sizedBox.width, 1);
      expect(sizedBox.height, 1);
      expect(circularProgress.strokeWidth, 1);
      expect(circularProgress.color, Colors.red);
    });
  });
}
