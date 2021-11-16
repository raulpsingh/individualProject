import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/databases/database_service.dart';
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

void saveAlarm(Alarm a) async{
  await DataBaseService().addAndEditAlarms(a);

}
