import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AFListTile', () {
    testWidgets('initial load', (tester) async {
      const widget = AFListTile();

      const app = MaterialApp(
        home: Material(child: widget),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();
    });

    testWidgets('all data is filled', (tester) async {
      const widget = AFListTile(
        leading: Text('leading'),
        title: 'title',
        subtitle: 'subtitle',
        trailing: Text('trailing'),
      );

      const app = MaterialApp(
        home: Material(child: widget),
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.text('leading'), findsOneWidget);
      expect(find.text('title'), findsOneWidget);
      expect(find.text('subtitle'), findsOneWidget);
      expect(find.text('trailing'), findsOneWidget);
    });
  });
}
