import 'dart:math';

import 'package:individual_project/objects/alarmObject.dart';

List _shortPhrases = [
  "You can totally do this",
  "No pressure no diamonds",
  "Stay foolish to stay sane",
  "When nothing goes right, go left",
  "Impossible is for the unwilling"
];
List _normalPhrases = [
  "A room without books is like a body without a soul",
  "You only live once but if you do it right once is enough",
  "If you tell the truth, you don't have to remember anything",
  "A friend is someone who knows all about you and still loves you",
  "Live as if you were to die tomorrow. Learn as if you were to live forever."
];
List _longPhrases = [
  "Two things are infinite: the universe and human stupidity; and I'm not sure about the universe",
  "Be who you are and say what you feel, because those who mind don't matter, and those who matter don't mind",
  "You know you're in love when you can't fall asleep because reality is finally better than your dreams",
  "If you want to know what a man's like, take a good look at how he treats his inferiors, not his equals.",
  "I've learned that people will forget what you said, people will forget what you did, but people will never forget how you made them feel."
];

String getShortPhrase() {
  final _random = new Random();
  String _phrase = _shortPhrases[_random.nextInt(_shortPhrases.length)];
  return _phrase;
}

String getNormalPhrase() {
  final _random = new Random();
  String _phrase = _normalPhrases[_random.nextInt(_normalPhrases.length)];
  return _phrase;
}

String getLongPhrase() {
  final _random = new Random();
  String _phrase = _longPhrases[_random.nextInt(_longPhrases.length)];
  return _phrase;
}

String? generatePhrase(Alarm? a) {
  String _phrase;
  if (a!.difficulty == 1) {
    _phrase = getShortPhrase();
    return _phrase;
  }
  if (a.difficulty == 2) {
    _phrase = getNormalPhrase();
    return _phrase;
  }
  if (a.difficulty == 3) {
    _phrase = getLongPhrase();
    return _phrase;
  }
}
