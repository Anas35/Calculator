import 'package:calculator/src/keyboard_function.dart';
import 'package:calculator/src/calculator/basic_calculation.dart';
import 'package:calculator/extension.dart';
import 'package:calculator/src/calculator/basic_power.dart';

class CalculatorFunction extends KeyboardController {

  CalculatorFunction();

  @override
  String get inputNumber => super.inputNumber;

  String history = '';

  final BasicCalculation basicCalculation = BasicCalculation.instance;
  final BasicPower basicPower = BasicPower.instance;

  String? temporary;

  @override
  List<String> get characters => [
        '+/-',
        '0',
        '.',
        '=',
        '1',
        '2',
        '3',
        '+',
        '4',
        '5',
        '6',
        '-',
        '7',
        '8',
        '9',
        'x',
        '1/x',
        'x²',
        '²√x',
        '÷',
        '%',
        'CE',
        'C',
        'Remove'
      ];

  List<String> powerOperands = ['1/x', 'x²', '²√x',];

  List<String> aritmeticOperatorsList = ['+', '-', 'x', '÷', '%', '='];

  bool _resetInput = false;
  bool _signChange = false;

  CalculatorFunction? _copyWith({bool? resetInput, bool? signChange, String? histo, String? number,required String? temp}) {
     _resetInput = resetInput ?? _resetInput;
     _signChange = signChange ?? _signChange;
      history = histo ?? history;
      inputNumber = number ?? inputNumber;
      temporary = temp;
  }

  void deleteAll() {
    _copyWith(number: '0', histo: '', temp: null);
    basicCalculation.clear();
  }

  void calculate(String char) {

    if (history.endsWith('=') && aritmeticOperatorsList.contains(char)) {
      _copyWith(histo: inputNumber, temp: null);
      basicCalculation.clear();
    }

    if(inputNumber == 'Cannot divide by zero') deleteAll();

    if (super.characters.contains(char)) {

      if (history.endsWith('=')) deleteAll();

      if (_resetInput) _copyWith(number: '0', resetInput: false, temp: temporary);
      if(history.containsList(_inputPower) && !history.endswithList(aritmeticOperatorsList)) {
        _copyWith(temp: temporary, histo: '');
      }

      if (char == '+/-') _copyWith(signChange: true, temp: temporary);

      showNumber(char);

      temporary = inputNumber;
    } else if (powerOperands.contains(char)) {

      if (history.endsWith('=')) _copyWith(histo: '', temp: inputNumber);

      power(char);
    } else if (char == 'C') {
      deleteAll();
    } else if (aritmeticOperatorsList.contains(char)) {
      ap(char);
    }
  }

  void ap(String char) {

    if (temporary != null) _copyWith(histo: history + temporary!, temp: null); 

    if (history.endswithList(aritmeticOperatorsList) && !_signChange) {
      history = history.substring(0, history.length - 1) + char;
      basicCalculation.copyWith(operans: char);
    } else {
      history += char;
      inputNumber = basicCalculation.airthemiticOperands(inputNumber, char);
      _copyWith(signChange: false, resetInput: true, temp: temporary);
    }
  }

  List<String> _inputPower = ['1/', 'sqr', '√'];

   void cont(String characters, String char) {
     if(history.containsList(_inputPower) && !history.endswithList(aritmeticOperatorsList)){
          history = characters; 
     } else {
          history += char; 
     }
   }


   void powerinput(String char) {

     if(temporary == null) _copyWith(temp: '0');

    switch (char) {
      case '1/x':
         cont('1/($history)', '1/($temporary)');
        break;
      case 'x²':
         cont('sqr($history)', 'sqr($temporary)');
      break;
      case '²√x':
         cont('√($history)', '√($temporary)');
      break;
    }
  }

  void power(String char) {
    
    powerinput(char);

    inputNumber = basicPower.powerCalcualtion(char, inputNumber);

    _copyWith(resetInput: true, temp: null);
  }
}