import 'dart:developer';

import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TextWithButton', () {
    testWidgets('all data is filled', (tester) async {
      final widget = TextWithButton(
        text: 'text',
        textButton: 'textButton',
        onPressed: (){
          log('test');
        },
      );

      final app = MaterialApp(
        home: widget,
      );

      await tester.pumpWidget(app);
      await tester.pumpAndSettle();

      expect(find.text('text'), findsOneWidget);
      expect(find.text('textButton'), findsOneWidget);
    });
  });
}
