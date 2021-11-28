import 'dart:math';

import 'package:individual_project/objects/alarmObject.dart';

int generateEasyNumbers() {
  Random _random = Random();
  int _randomNumber = _random.nextInt(10) + 1;
  return _randomNumber;
}

int generateNormalNumbers() {
  Random _random = Random();
  int _randomNumber = _random.nextInt(50) + 20;
  return _randomNumber;
}

int generateHardNumber() {
  Random _random = Random();
  int _randomNumber = _random.nextInt(200) + 50;
  return _randomNumber;
}

String generateMathOperation() {
  Random _random = Random();
  List _operations = ["+", "-"];
  String _operation = _operations[_random.nextInt(_operations.length)];
  return _operation;
}

List? generateEasyMath() {
  int a = generateEasyNumbers();
  int b = generateEasyNumbers();
  if (a - b < 0) {
    return generateEasyMath();
  } else {
    List _math = [a.toString(), generateMathOperation(), b.toString()];
    return _math;
  }
}

List? generateNormalMath() {
  int a = generateNormalNumbers();
  int b = generateNormalNumbers();
  if (a - b < 0) {
    return generateNormalMath();
  } else {
    List _math = [a.toString(), generateMathOperation(), b.toString()];
    return _math;
  }
}

List? generateHardMath() {
  int a = generateHardNumber();
  int b = generateHardNumber();
  if (a - b < 0) {
    return generateHardMath();
  } else {
    List _math = [a.toString(), generateMathOperation(), b.toString()];
    return _math;
  }
}

List? generateMath(Alarm? a) {
  List? _mathProblem;
  if (a!.difficulty == 1) {
    _mathProblem = generateEasyMath();
    return _mathProblem;
  }
  if (a.difficulty == 2) {
    _mathProblem = generateNormalMath();
    return _mathProblem;
  }
  if (a.difficulty == 3) {
    _mathProblem = generateHardMath();
    return _mathProblem;
  }
}
