import 'package:appsfactory_test/core/core.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Formatters durationToMinutes', () {
    test('value 0 should be 00:00', (){
      final value = Formatters.durationToMinutes(0);
      expect('00:00', value);
    });
    test('value <0 should be 00:00', (){
      final value = Formatters.durationToMinutes(-1);
      expect('00:00', value);
    });
    test('value 800 should be 13:20', (){
      final value = Formatters.durationToMinutes(800);
      expect('13:20', value);
    });
  });
}
