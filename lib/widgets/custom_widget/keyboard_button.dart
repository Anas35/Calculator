import 'package:flutter/material.dart';

class KeyboardButton extends StatelessWidget {

  final Widget child;
  final void Function() function;
  final Color? color;
  final TextStyle? textStyle;

  KeyboardButton({Key? key,required this.child, required this.function, this.color, this.textStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: super.key,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(), 
          primary: color,
          textStyle: textStyle
        ),
      child: child,
      onPressed: function,
    );
  }
}
