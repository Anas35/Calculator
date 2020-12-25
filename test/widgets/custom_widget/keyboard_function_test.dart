import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/widgets/custom_widget/keyboard_function.dart';

void main() {

  group('Keyboard function', () {

    test('return text', (){

    KeyboardController keyboardController = KeyboardController();

    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(3);
    expect(keyboardController.inputNumber, '1');

    keyboardController.showNumber(4);
    expect(keyboardController.inputNumber, '12');

    keyboardController.showNumber(2);
    expect(keyboardController.inputNumber, '12.');

    keyboardController.showNumber(2);
    expect(keyboardController.inputNumber, '12.');

    keyboardController.showNumber(5);
    expect(keyboardController.inputNumber, '12.3');

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '-12.3');

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '12.3');

    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '12.');

    keyboardController.showNumber(13);
    expect(keyboardController.inputNumber, '0');

  });

  test('dot', (){

    KeyboardController keyboardController = KeyboardController();

    keyboardController.showNumber(2);
    expect(keyboardController.inputNumber, '0.');

    keyboardController.showNumber(2);
    expect(keyboardController.inputNumber, '0.');

    keyboardController.showNumber(3);
    expect(keyboardController.inputNumber, '0.1');

    keyboardController.showNumber(13);
    keyboardController.showNumber(3);
    keyboardController.showNumber(2);
    expect(keyboardController.inputNumber, '1.');

    keyboardController.showNumber(2);
    expect(keyboardController.inputNumber, '1.');

    keyboardController.showNumber(3);
    expect(keyboardController.inputNumber, '1.1');

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '-1.1');  

    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '-1.');  

    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '-1');

  });

  test('sign', (){

    KeyboardController keyboardController = KeyboardController();

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '-0');

    keyboardController.showNumber(3);
    expect(keyboardController.inputNumber, '-1');

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '1');

    keyboardController.showNumber(2);
    keyboardController.showNumber(3);
    expect(keyboardController.inputNumber, '1.1');

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '-1.1');

    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '-1.');

    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '-1');

    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '-0');

    keyboardController.showNumber(2);
    expect(keyboardController.inputNumber, '-0.');

    keyboardController.showNumber(3);
    expect(keyboardController.inputNumber, '-0.1');

    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '0.1');

  });

  test('delete', (){

    KeyboardController keyboardController = KeyboardController();

    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(3);
    keyboardController.showNumber(4);
    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '1');

    keyboardController.showNumber(13);

    keyboardController.showNumber(2);
    keyboardController.showNumber(3);
    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '0.');

    keyboardController.showNumber(13);

    keyboardController.showNumber(3);
    keyboardController.showNumber(0);
    keyboardController.showNumber(3);
    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '-1');

    keyboardController.showNumber(13);

    keyboardController.showNumber(3);
    keyboardController.showNumber(0);
    keyboardController.showNumber(14);
    expect(keyboardController.inputNumber, '0');

  });

  test('clear all', (){

    KeyboardController keyboardController = KeyboardController();

    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(13);
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(3);
    keyboardController.showNumber(4);
    expect(keyboardController.inputNumber, '12');
    keyboardController.showNumber(13);
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(2);
    keyboardController.showNumber(3);
    expect(keyboardController.inputNumber, '0.1');
    keyboardController.showNumber(13);
    expect(keyboardController.inputNumber, '0');

    keyboardController.showNumber(3);
    keyboardController.showNumber(0);
    expect(keyboardController.inputNumber, '-1');
    keyboardController.showNumber(13);
    expect(keyboardController.inputNumber, '0');

  });

  });

}