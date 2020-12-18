import 'package:calculator/src/converter/converter.dart';
import 'package:calculator/widgets/custom_widget/keyboard.dart';
import 'package:calculator/widgets/custom_widget/keyboard_function.dart';
import 'package:calculator/widgets/custom_widget/popup_menu.dart';
import 'package:flutter/material.dart';

class ContentScreen<T> extends StatefulWidget {

  final List<T> types;

  const ContentScreen({required this.types});

  @override
  _ContentScreenState<T> createState() => _ContentScreenState<T>();
}

class _ContentScreenState<T> extends State<ContentScreen<T>>{

  late Converter<T> converter;

  late String value1 = converter.inputValue;
  late String value2 = converter.mainFunction();

  bool isFirstButton = true;

  late T type1 = converter.typeFrom;
  late T type2 = converter.typeTo;

  bool check = true;

  KeyBoardController _keyBoardController = KeyBoardController.instance;

  void changeCondition() {
    setState(() {
      isFirstButton = !isFirstButton;
      check = false;
      _keyBoardController.inputText = '0';

      var temp = converter.typeFrom;
      converter.typeFrom = converter.typeTo;
      converter.typeTo = temp;

      check = false;
    });
  }

  void getText(String inputValue) {
    setState(() {

      converter.inputValue = inputValue;

      if (isFirstButton) {
        value1 = converter.inputValue;
        value2 = converter.mainFunction();
      } else {
        value2 = converter.inputValue;
        value1 = converter.mainFunction();
      }
    });
  }

  void setSelected(value) {
    setState(() {
      isFirstButton ? converter.typeFrom = value : converter.typeTo = value;
      isFirstButton ? type1 = value : type2 = value;
    });
  }

  void getSelected(value) {
    setState(() {
      isFirstButton ? converter.typeTo = value : converter.typeFrom = value;
      isFirstButton ? type2 = value : type1 = value;
    });
  }

  @override
  void initState() {
    converter = Converter<T>(inputValue: '0', typeFrom: widget.types[0], typeTo: widget.types[1]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (check) {
      if (isFirstButton) {
        value2 = converter.mainFunction();
      } else {
        value1 = converter.mainFunction();
      }
    }

    check = true;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: changeCondition,
                  child: Text(
                    value1,
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight:
                            isFirstButton ? FontWeight.bold : FontWeight.w500),
                  ),
                ),
                MenuSelection(
                  types: widget.types,
                  onSelected: setSelected,
                ),
                GestureDetector(
                  onTap: changeCondition,
                  child: Text(
                    value2,
                    style: TextStyle(
                        fontSize: 56,
                        fontWeight:
                            !isFirstButton ? FontWeight.bold : FontWeight.w500),
                  ),
                ),
                MenuSelection(
                  types: widget.types,
                  initialType: widget.types[1],
                  onSelected: getSelected,
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Keyboard(
            getValue: getText,
          ),
        ),
      ],
    );
  }
}
