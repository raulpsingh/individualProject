import 'dart:async';
import 'dart:math';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/objects/user.dart';
import 'package:individual_project/services/database_service.dart';
import 'package:intl/intl.dart';

import '../objects/alarmObject.dart';

String dateFormat(Timestamp time){
  DateTime date = time.toDate();
  String _time = DateFormat.jm().format(date);
  return _time;
}
DateTime formatTimeStamp(Timestamp time){
  DateTime _date = time.toDate();
  return _date;
}
String formatDate(DateTime time){
  String _time = DateFormat.jm().format(time);
  return _time;
}
class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.centerLeft,
        radius: 0.8,
        colors: [Colors.red, Colors.orange],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}

Future <void> saveAlarm(Alarm a) async{
  await DataBaseService().addAndEditAlarms(a);

}
String correction(String a){
  RegExp exp = RegExp(r"[^\w\s+-?/:*^=]+");
  String b = a.replaceAll(exp,'');
  b = b.replaceAll(',','');
  return b;
}


class idAdd {
  static  List alarms = <Alarm>[];
  static late StreamSubscription<List<Alarm>> alarmStreamSubscription;
  static  DataBaseService db = DataBaseService();
  static  int id = 0;

  static Future<void> loadData(AppUser user) async {
    var stream = db.getAlarms(user.id);
    alarmStreamSubscription = stream.listen((List<Alarm> data) {
      alarms = data;
    });
  }

  static int? addId(AppUser? user)  {
    loadData(user!);
    for (int i = 0; i < alarms.length; i++) {
      if (alarms[i].id != null) {
        print('1');
        id=1;
        List max = <int>[];
        max.add(alarms[i].id);
        int b = max.reduce((a, b) => a > b ? a : b);
        id = b + 1;
        return id;
      }
      if (alarms[i].id == null) {
        print('2');
        id = 0;
        return id;
      }
    }

  }
}

int randomId(){
  var random = Random();
  int id1 = random.nextInt(100000000);
  int id2 = random.nextInt(100000000);
  int id3 = id2+id1;
  return id3;
}