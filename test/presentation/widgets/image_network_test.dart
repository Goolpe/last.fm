import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ImageNetwork', () {
    testWidgets('imageUrl is null', (tester) async {
      const widget = ImageNetwork(null);

      const app = MaterialApp(
        home: widget,
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
    });

    testWidgets('imageUrl is empty', (tester) async {
      const widget = ImageNetwork('');

      const app = MaterialApp(
        home: widget,
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
    });

    testWidgets('imageUrl is broken', (tester) async {
      const widget = ImageNetwork('broken');

      const app = MaterialApp(
        home: widget,
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
    });
  });
}
