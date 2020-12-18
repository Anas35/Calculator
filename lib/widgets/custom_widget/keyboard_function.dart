typedef GetValue = void Function(String);

class KeyBoardController {

  static final KeyBoardController _temperatureConverter = KeyBoardController._internal();

  KeyBoardController._internal();

  static KeyBoardController get instance => _temperatureConverter;

  String inputText = '0';

  final List<String> letters = [
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

  void getFunction(int index) {

    if(letters[index] == '.' && inputText.length < 9) {
      _dot();
    } else if (letters[index] == 'CE') {
      _clearAll();
    } else if (index == 14) {
      _clear();
    } else if(inputText.length < 10) {
      _text(letters[index]);
    }
  } 

  void _clearAll() {
     inputText = '0';
  }

  void _clear() {
    if(inputText != '0'){
       inputText = inputText.substring(0, inputText.length - 1);
    }

    if(inputText.isEmpty) inputText = '0';
  }

  void _dot() {
    assert(inputText.isNotEmpty);

    if(inputText.contains('.')){
       return;
    } else {
      inputText += '.';
    }
  }

  void _text(String value) {
    if(inputText.startsWith('0') && !inputText.contains('0.')) inputText = ''; 
    inputText += value;
  }
}