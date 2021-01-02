extension Rounded on num {

  String toRound() {

  String inputNumber = this.toString();
  List<String> numbersList = inputNumber.contains('.') ? inputNumber.split('.') : [inputNumber];
   
     if(inputNumber.contains('.0') && numbersList[1].length == 1){
       return this.toInt().toString();
     } else if(inputNumber.length > 9) {
        if(numbersList[0].length >= 9) { 
          return this.toStringAsPrecision(8); 
        } else {
          return this.toStringAsFixed(8 - numbersList[0].length);
        }      
     } else {
       return inputNumber;
     }
  }
}

extension UsefullExtension on String {

  bool endswithList(List<String> list) {
    bool check = false;
    for(String i in list) {
      if(this.endsWith(i)) {
         check = true;
         break;
      }
    }
    return check;
  }

  bool containswithList(List<String> list) {
    bool check = false;
    for(String i in list) {
      if(this.contains(i)) {
         check = true;
         break;
      }
    }
    return check;
  }

  num toNum() {
    return num.parse(this);
  }

}