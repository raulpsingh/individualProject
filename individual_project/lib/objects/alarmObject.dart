

import 'package:cloud_firestore/cloud_firestore.dart';

class Alarm{
  late  String? uid;
  String? author;
  String? label;
  late Timestamp time;
  late bool status;

  Alarm({this.uid,this.author, this.label,required this.time, required this.status});



  Map<String, dynamic> toMap(){
    return {
      "author" : author,
      "label" : label,
      "time" : time,
      "status" : status
    };
  }

  Alarm.fromJson(String uid, Map<String, dynamic> data){
    this.uid= uid;
    author = data['author'];
    label = data['label'];
    time = data['time'];
    status = data['status'];



  }





}
