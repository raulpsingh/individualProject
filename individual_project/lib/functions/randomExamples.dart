import 'dart:math';


int generateEasyNumbers(){
  Random _random= Random();
  int _randomNumber= _random.nextInt(10)+1;
  return _randomNumber;
}

String generateMathOperation(){
  Random _random = Random();
  List _operations = ["+","-"];
  String _operation = _operations[_random.nextInt(_operations.length)];
  return _operation;
}

List? generateEasyMath(){
  int a=generateEasyNumbers();
  int b= generateEasyNumbers();
  if(a-b<0){
     return generateEasyMath();
  } else {
    List _math = [a.toString(), generateMathOperation(), b.toString()];
    return _math;
  }
}