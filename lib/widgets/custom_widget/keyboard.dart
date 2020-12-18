import 'package:flutter/material.dart';
import 'keyboard_function.dart';

class Keyboard extends StatefulWidget {

  final GetValue getValue;

  const Keyboard({required this.getValue});

  @override
  _KeyboardState createState() => _KeyboardState();
}

class _KeyboardState extends State<Keyboard> {

  KeyBoardController keyBoardController = KeyBoardController.instance;

  late List<String> letters = keyBoardController.letters;

  void getText(int index) {
     keyBoardController.getFunction(index);
     widget.getValue(keyBoardController.inputText);
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
                             letters[index],
                          ),
                    onPressed: () {
                       getText(index);
                    },
                  ),
                );
        },
      ),
      reverse: true,
    );
  }
}
