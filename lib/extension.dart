extension Rounded on num {

  String toRound() {

  String inputNumber = this.toString();
  List<String> numbersList = inputNumber.contains('.') ? inputNumber.split('.') : [inputNumber];
   
     if(inputNumber.contains('.0') && numbersList[1].length == 1){
       return this.toInt().toString();
     } else if(inputNumber.length > 9) {
       if(inputNumber.contains('e')) {
         return this.toStringAsExponential(8);
       } else if(numbersList[0].length > 9) { 
          return this.toStringAsPrecision(8); 
        } else {
          return this.toStringAsFixed(8 - numbersList[0].length);
        }      
     } else {
       return inputNumber;
     }
  }
}