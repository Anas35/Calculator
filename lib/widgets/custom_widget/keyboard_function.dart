typedef GetInputNumbers = void Function(String);

class KeyboardController {

  static final KeyboardController _keyboardConverter = KeyboardController._internal();

  KeyboardController._internal();

  static KeyboardController get instance => _keyboardConverter;

  String inputNumber = '0';

  final List<String> keys = [
    '',
    '0',
    '.',
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '',
    'CE',
    '',
  ];

  void showNumber(int index) {

    if(keys[index] == '.' && inputNumber.length < 9) {
      _dot();
    } else if (keys[index] == 'CE') {
      _clearAll();
    } else if (index == 14) {
      _clear();
    } else if(inputNumber.length < 10) {
      _number(keys[index]);
    }
  } 

  void _clearAll() {
     inputNumber = '0';
  }

  void _clear() {
    if(inputNumber != '0'){
       inputNumber = inputNumber.substring(0, inputNumber.length - 1);
    }

    if(inputNumber.isEmpty) inputNumber = '0';
  }

  void _dot() {
    assert(inputNumber.isNotEmpty);

    if(inputNumber.contains('.')){
       return;
    } else {
      inputNumber += '.';
    }
  }

  void _number(String number) {
    if(inputNumber.startsWith('0') && !inputNumber.contains('0.')) inputNumber = ''; 
    inputNumber += number;
  }
}