import 'package:calculator/src/converter/type.dart';
import 'package:flutter/material.dart';
import 'keyboard_function.dart';

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

  Widget buttons(int index) {
    if (index == 12 || (index == 0 && !sign())) {
      return SizedBox(key: Key('SizedBox'));
    } else {
      return MyButton(
        text: characters,
        index: index,
        function: () {
          getNumber(index);
        },
      );
    }
  }

  late List<String> characters = widget.keyboardController.characters;

  void getNumber(int index) {
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

class MyButton extends StatelessWidget {
  
  final int index;
  final void Function() function;
  final List<String> text;

  MyButton({required this.index, required this.function, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(), primary: color),
      child: index == 14
          ? Icon(Icons.close_sharp, size: 32)
          : Text(
              text[index],
              style: textStyle,
            ),
      onPressed: function,
    );
  }

  late final Color color = index == 13 || index == 14
      ? Colors.black.withOpacity(0.50)
      : Colors.black.withOpacity(0.75);

  late final TextStyle textStyle = index == 13
      ? TextStyle(fontSize: 24, fontWeight: FontWeight.w400)
      : TextStyle(fontSize: 32, fontWeight: FontWeight.w700);
}
