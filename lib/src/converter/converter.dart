import 'package:calculator/src/converter/converter_values.dart';
import 'package:calculator/src/converter/temperature.dart';

class Converter<T> {

  String inputValue;
  T typeFrom;
  T typeTo;

  Converter(this.inputValue,{required this.typeFrom, required this.typeTo}){
    mainFunction();
  }

  String mainFunction() {
    switch (T) {
      case Temperature: return TemperatureConverter.instance.answer(inputValue, typeFrom as Temperature, typeTo as Temperature);
      default: return ConverterValues.answer<T>(inputValue, typeFrom, typeTo);
    }
  }
}