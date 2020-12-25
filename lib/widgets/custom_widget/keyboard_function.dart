typedef GetInputNumbers = void Function(String);

class KeyboardController {

  KeyboardController();

  String inputNumber = '0';

  final List<String> characters = [
    '+/-',
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

    if(index == 0) {
      _changeSign();
    } else if(characters[index] == '.' && inputNumber.length < 9) {
      _dot();
    } else if (characters[index] == 'CE') {
      _clearAll();
    } else if (index == 14) {
      _clear();
    } else if(inputNumber.length < 10) {
      _number(characters[index]);
    }
  } 

  void _changeSign() {
    if(!inputNumber.contains('-')){
      inputNumber = '-' + inputNumber;
    } else {
      inputNumber = inputNumber.substring(1, inputNumber.length);
    }
  }

  void _clearAll() {
     inputNumber = '0';
  }

  void _clear() {
    if(inputNumber.contains('-') && inputNumber.length == 2){
      inputNumber = inputNumber.substring(1, inputNumber.length - 1);
    } else if(inputNumber != '0'){
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
    if(inputNumber == '-0') inputNumber = '-';
    inputNumber += number;
  }
}