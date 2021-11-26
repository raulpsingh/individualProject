
import 'package:cloud_firestore/cloud_firestore.dart';

class History {
  late  String? uid;
  late String? author;
  late int mission;
  late Timestamp time;
  late int timer;

  History({this.uid,required this.author,required this.mission, required this.time, required this.timer});


  Map<String, dynamic> toMap() {
    return {
      "author": author,
      "mission" : mission,
      "time": time,
      "timer": timer,
    };
  }


  History.fromJson(String uid,Map<String,dynamic> data){
    this.uid=uid;
    author=data["author"];
    mission = data['mission'];
    time = data['time'];
    timer =data["timer"];
  }


}