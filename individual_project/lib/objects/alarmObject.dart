
import 'package:cloud_firestore/cloud_firestore.dart';

class Alarm{
  late int? id;
  late  String? uid;
  String? author;
  String? label;
  late Timestamp time;
  late bool status;
  late int mission;
  late int? numberOfProblems;
  late int? difficulty;

  Alarm({this.id,this.uid,this.author, this.label,required this.time, required this.status,this.mission=0,this.difficulty,this.numberOfProblems});



  Map<String, dynamic> toMap(){
    return {
      "id" : id,
      "author" : author,
      "label" : label,
      "time" : time,
      "status" : status,
      "mission" : mission,
      "numberOfProblems" : numberOfProblems,
      "difficulty" : difficulty,
    };
  }

  Alarm.fromJson(String uid, Map<String, dynamic> data){
    id = data["id"];
    this.uid= uid;
    author = data['author'];
    label = data['label'];
    time = data['time'];
    status = data['status'];
    mission = data['mission'];
    numberOfProblems = data['numberOfProblems'];
    difficulty = data['difficulty'];
  }
}

