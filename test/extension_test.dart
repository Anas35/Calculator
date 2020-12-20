import 'package:calculator/extension.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('round a number and convert it to String', () {

    const num number1 = 1;
    const num number2 = 1.0; 
    const num number3 = 1.1;
    const num number4 = 123456789;
    const num number5 = 1.3456789;
    const num number6 = 1234567890;
    const num number7 = 123456789101112;
    const num number8 = 123456789.101112;
    const num number9 = 12345.101112;    
    const num number10 = 1.1011112211;    

    test('to String', (){
      expect(number1.toRound(), equals('1'));
    });

    // check if num contains only one decimal points as '0' 
    // and convert it into Int
    test('As int', (){
      expect(number2.toRound(), equals('1'));
      expect(number3.toRound(), isNot('1'));
    });
    
    // check if length of num is lesser than 9,
    // It will not round and will return same number into string.
    test('max length', (){
      expect(number4.toRound(), equals('123456789'));
      expect(number5.toRound(), equals('1.3456789'));
      expect(number6.toRound(), isNot('1234567890'));
    }); 

   // check if length of integer is greater than 9,
   // then the value should round to 9 digit
    test('toStringAsPrecison', (){
     expect(number7.toRound(), equals(number7.toStringAsPrecision(8)));
     expect(number8.toRound(), equals(number8.toStringAsPrecision(8)));
   });

    // check if length of interger is lesser than 9,
    // then the value should round to 9 digit using [toStringAsFixed]
    test('toStringAsFixed', (){
      expect(number9.toRound(), '12345.101');
      expect(number10.toRound(), '1.1011112');
    });

  });

}