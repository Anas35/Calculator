import 'package:calculator/src/converter/type.dart';
import 'package:calculator/widgets/custom_widget/keyboard_button.dart';
import 'package:flutter/material.dart';
import 'package:calculator/src/keyboard_function.dart';

class ConverterKeyboard<T> extends StatefulWidget {
  final GetInputNumbers getInputNumbers;
  final KeyboardController keyboardController;

  const ConverterKeyboard({required this.getInputNumbers, required this.keyboardController});

  @override
  _ConverterKeyboardState<T> createState() => _ConverterKeyboardState<T>();
}

class _ConverterKeyboardState<T> extends State<ConverterKeyboard<T>> {

  bool sign() {
    switch (T) {
      case Temperature:
      case Power:
      case Angle:
        return true;
      default:
        return false;
    }
  }

  Color primary(int index) { 
    return index == 13 || index == 14 ? Colors.black.withOpacity(0.50) : Colors.black.withOpacity(0.75);
  }

  TextStyle textStyle(int index) {
    return index == 13 ? TextStyle(fontSize: 24, fontWeight: FontWeight.w400)
      : TextStyle(fontSize: 32, fontWeight: FontWeight.w700);
  }

  ///TODO convert the index into string

  Widget buttons(int index) {
    if (index == 12 || (index == 0 && !sign())) {
      return SizedBox(key: Key('SizedBox'));
    } else {
      return KeyboardButton(
        child: index == 14 ? Icon(Icons.close_sharp, size: 32) : Text(characters[index]),
        function: () => getNumber(characters[index]),
        textStyle: textStyle(index),
        color: primary(index),
      );
    }
  }

  late List<String> characters = widget.keyboardController.characters;

  void getNumber(String index) {
    widget.keyboardController.showNumber(index);
    widget.getInputNumbers(widget.keyboardController.inputNumber);
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(2.5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.75,
        mainAxisSpacing: 2.5,
        crossAxisSpacing: 2.5,
        crossAxisCount: 3,
      ),
      children: List.generate(
        15,
        (index) {
          return buttons(index);
        },
      ),
      reverse: true,
    );
  }
}