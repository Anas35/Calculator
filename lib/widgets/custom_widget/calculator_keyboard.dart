import 'package:calculator/src/keyboard_function.dart';
import 'package:calculator/src/calculator/calculator_function.dart';
import 'package:calculator/widgets/custom_widget/keyboard_button.dart';
import 'package:flutter/material.dart';

class Calculator extends StatelessWidget {

  final GetInputNumbers getInputNumbers;
  final CalculatorFunction calculatorFunction;

  Calculator({Key? key,required this.getInputNumbers,required this.calculatorFunction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(2.5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.35,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        crossAxisCount: 4,
      ),
     children: List.generate(calculatorFunction.characters.length, 
       (index) {
         return buttons(index);
       }),
       reverse: true,
    );
  }

  late final List<String> letters = calculatorFunction.characters;

  Widget buttons(int index) {
    return KeyboardButton(
        child: letters[index] == 'Remove' ? Icon(Icons.close_sharp, size: 32) : Text(letters[index]),
        function: () => getInputNumbers(calculatorFunction.characters[index]),
        textStyle: textStyle(index),
        color: color(index),
      );
  }

  TextStyle textStyle(int index) {
    if (calculatorFunction.aritmeticOperatorsList.contains(letters[index])
       || calculatorFunction.powerOperands.contains(letters[index]) || letters[index] == 'CE'
       || letters[index] == 'C'|| letters[index] == 'Remove' ) {
         return TextStyle(fontSize: 32, fontWeight: FontWeight.w400);
    } else {
      return TextStyle(fontSize: 32, fontWeight: FontWeight.w700);
    } 
  }

  Color color(int index) {
    if(letters[index] == '=') {
      return Colors.cyan;
    } else if (calculatorFunction.aritmeticOperatorsList.contains(letters[index])
       || calculatorFunction.powerOperands.contains(letters[index]) || letters[index] == 'CE'
       || letters[index] == 'C'|| letters[index] == 'Remove' ) {
         return Colors.black.withOpacity(0.50);
    } else {
      return Colors.black.withOpacity(0.75);
    }
  }
}