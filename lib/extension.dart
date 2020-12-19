extension Rounded on num {

  String toRound() {

  String numInString = this.toString();
  List<String> text = numInString.contains('.') ? numInString.split('.') : [numInString];
   
     if(numInString.contains('.0') && text[1].length == 1){
       return this.toInt().toString();
     } else if(numInString.length > 9) {
       if(numInString.contains('e')) {
         return this.toStringAsExponential(8);
       } else if(text[0].length > 9) { 
          return this.toStringAsPrecision(8); 
        } else {
          return this.toStringAsFixed(8 - text[0].length);
        }      
     } else {
       return numInString;
     }
  }
}