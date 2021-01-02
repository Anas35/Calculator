import 'package:calculator/src/calculator/calculator_function.dart';
import 'package:calculator/widgets/custom_widget/calculator_keyboard.dart';
import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  CalculatorFunction calculatorFunction = CalculatorFunction();

  late String answer = '0';
  late String history = '';

  void getValues() {
    setState(() {
    answer = calculatorFunction.inputNumber;
    history = calculatorFunction.history;
    });
  }

  @override
  void initState() {
    getValues();
    super.initState();
  }

  void callFunction(String keys)  {
    calculatorFunction.calculate(keys);
    getValues();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(history, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),),
                    SizedBox(height: 10,),
                    Text(answer, style: TextStyle(fontSize: 52, fontWeight: FontWeight.bold)),
                  ],
                    ),
                ),),
              Expanded(
                flex: 7,
                child: Calculator(
                  getInputNumbers: callFunction, 
                  calculatorFunction: calculatorFunction
                  ),
                ),
            ],
          ),
        );
  }
}