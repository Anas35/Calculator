import 'package:flutter/material.dart';
import 'keyboard_function.dart';

class ConverterKeyboard extends StatefulWidget {

  final GetInputNumbers getInputNumbers;

  const ConverterKeyboard({required this.getInputNumbers});

  @override
  _ConverterKeyboardState createState() => _ConverterKeyboardState();
}

class _ConverterKeyboardState extends State<ConverterKeyboard> {

  KeyboardController keyBoardController = KeyboardController.instance;

  late List<String> keys = keyBoardController.keys;

  void getNumber(int index) {
     keyBoardController.showNumber(index);
     widget.getInputNumbers(keyBoardController.inputNumber);
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
          return index == 0 || index == 12
              ? SizedBox()
              : ElevatedButtonTheme(
                  data: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      primary: Colors.black.withOpacity(
                          index == 13 || index == 14 ? 0.50 : 0.75),
                      textStyle: TextStyle(
                          fontSize: index == 13 ? 24 : 32,
                          fontWeight: index == 13 ? FontWeight.w400 : FontWeight.w700
                        ),
                      ),
                    ),
                  child: ElevatedButton(
                    child: index == 14
                        ? Icon(
                            Icons.close_sharp,
                            size: 32,
                          )
                        : Text(
                             keys[index],
                          ),
                    onPressed: () {
                       getNumber(index);
                    },
                  ),
                );
        },
      ),
      reverse: true,
    );
  }
}
