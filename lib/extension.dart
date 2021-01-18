extension RoundDigits on num {

  String toRound() {

  String inputNumber = this.toString();
  List<String> splitedNumber = inputNumber.contains('.') ? inputNumber.split('.') : [inputNumber];
   
     if(inputNumber.contains('.0') && splitedNumber[1].length == 1){
       return this.toInt().toString();
     } else if(inputNumber.length > 12) {
        if(splitedNumber[0].length >= 12) { 
          return this.toStringAsPrecision(11); 
        } else {
          return this.toStringAsFixed(11 - splitedNumber[0].length);
        }      
     } else {
       return inputNumber;
     }
  }
}

extension UsefullExtension on String {

  bool endswithList(List<String> list) {
    bool isEndsWith = false;
    for(String i in list) {
      if(this.endsWith(i)) {
         isEndsWith = true;
         break;
      }
    }
    return isEndsWith;
  }

  bool containsList(List<String> list) {
    bool isContains = false;
    for(String i in list) {
      if(this.contains(i)) {
         isContains = true;
         break;
      }
    }
    return isContains;
  }

  num toNum() {
    try {
     return num.parse(this); 
    } catch (e) {
      throw e;
    }
  }

}