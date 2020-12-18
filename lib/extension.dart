extension Rounded on num {

  String toRound() {

    String numInString = this.toString();
    List<String>? text = numInString.contains('.') ? numInString.split('.') : null;

    if(numInString.contains('.') && numInString.length > 10){
     return text!= null ? this.toStringAsFixed(9 - text[0].length) : numInString;
    } else if(text?[1].length == 1){
      return text != null ? this.toInt().toString() : numInString;
    } else if(numInString.length > 10) {
      return this.toStringAsExponential(numInString.length - 6);
    } else {
      return numInString;
    }
  }
}

