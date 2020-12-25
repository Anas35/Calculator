import 'package:calculator/src/converter/converter.dart';
import 'package:calculator/src/converter/type.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('unt converter', () {

    Converter converter = Converter<Angle>('1', typeFrom: Angle.Degrees, typeTo: Angle.Radians);

    test('answer', (){
      expect(converter.mainFunction(), equals('0.0174533'));
    });

    test('change inputValue', (){
      converter.inputValue = '10';

      expect(converter.mainFunction(), equals('0.1745329'));
    });

    test('change typeFrom', (){
      converter.typeFrom = Angle.Radians;

      expect(converter.mainFunction(), equals('10'));
    });

    test('change typeTo', (){
      converter.typeTo = Angle.Degrees;

      expect(converter.mainFunction(), '572.9578');
    });

  });
}