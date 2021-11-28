import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/objects/historyObject.dart';
import 'package:individual_project/objects/missionObject.dart';
import 'package:individual_project/objects/user.dart';
import 'package:individual_project/services/database_service.dart';
import 'package:individual_project/services/notification_service.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'package:intl/intl.dart';
import 'package:individual_project/objects/alarmObject.dart';

DataBaseService db = DataBaseService();

String dateFormat(Timestamp time, String? locale) {
  DateTime date = time.toDate();
  String _time = DateFormat.jm(locale).format(date);
  return _time;
}

String monthFormat(Timestamp time, String? locale) {
  DateTime date = time.toDate();
  String _time = DateFormat.MMMMd(locale).format(date);
  return _time;
}

String weekDayFormat(Timestamp time, String? locale) {
  DateTime date = time.toDate();
  String _time = DateFormat.EEEE(locale).format(date);
  return _time;
}

DateTime formatTimeStamp(Timestamp time) {
  DateTime _date = time.toDate();
  return _date;
}

String formatDate(DateTime time) {
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

Future<void> saveAlarm(Alarm a) async {
  await db.addAndEditAlarms(a);
}

void addAlarm(DateTime time, AppUser? user, String label) {
  if (time.isBefore(DateTime.now())) {
    time = time.add(Duration(days: 1));
  }
  Timestamp stamp = Timestamp.fromDate(time);
  Alarm a = Alarm(
      mission: 1,
      id: randomId(),
      author: user!.id,
      label: label,
      time: stamp,
      status: true);
  Alarm c = MissionAddHelper.addMissionToAlarm(a);
  saveAlarm(c);
  NotificationService.showNotification(a);
}

void editAlarm(Alarm alarm,String label,DateTime _time) {

  if(_time.isBefore(DateTime.now())) {
    _time = _time.add(Duration(days: 1));
  }
  Timestamp stamp = Timestamp.fromDate(_time);
  if(alarm.time != stamp) {
    alarm.time = stamp;
  }
  if(alarm.label != label) {
    alarm.label = label;
  }
  NotificationService.removeNotification(alarm);
  Alarm c = MissionAddHelper.addMissionToAlarm(alarm);
  NotificationService.showNotification(c);
  saveAlarm(c);

}


Stream<List<Alarm>> getAlarms(AppUser user) {
  return db.getAlarms(user.id);
}

void removeAlarm(Alarm alarm) {
  db.removeAlarm(alarm);
}


String correction(String a) {
  RegExp exp = RegExp(r"[^\w\s+-?/:*^=]+");
  String b = a.replaceAll(exp, '');
  b = b.replaceAll(',', '');
  return b;
}

int randomId() {
  var random = Random();
  int id1 = random.nextInt(100000000);
  int id2 = random.nextInt(100000000);
  int id3 = id2 + id1;
  return id3;
}

bool? checkResult(List? _example, String _result) {
  int num1 = int.parse(_example![0]);
  int num2 = int.parse(_example[2]);
  if (_example[1] == "+") {
    int _checkResult = num1 + num2;
    print(_checkResult.toString());
    if (int.parse(_result) == _checkResult) {
      return true;
    } else
      return false;
  }
  if (_example[1] == "-") {
    int _checkResult = num1 - num2;
    print(_checkResult.toString());
    if (int.parse(_result) == _checkResult) {
      return true;
    } else
      return false;
  }
}

int? decide(Alarm? alarm) {
  Alarm? a = alarm;
  if (a!.mission == 1) {
    return 1;
  }
  if (a.mission == 2) {
    return 2;
  }
  if (a.mission == 3) {
    return 3;
  }
}

void addHistory(History history) {
  db.addHistory(history);
}

Stream<List<History>> getHistories(AppUser user) {
  return db.getHistory(user.id);
}

String? timeSpent(int timer) {
  String a;
  if (timer < 60) {
    String sec = LocaleKeys.seconds_text.tr();
    a = "$timer $sec";
    return a;
  }
  if (timer > 60) {
    int minutes = timer ~/ 60;
    int seconds = timer % 60;
    String min = LocaleKeys.minutes_text.tr();
    String sec = LocaleKeys.seconds_text.tr();
    String and = LocaleKeys.and_text.tr();
    a = "$minutes $min $and $seconds $sec";
    return a;
  }
}

String? missionDefiner(int mission) {
  String a;
  if (mission == 1) {
    a = LocaleKeys.off_text.tr();
    return a;
  }
  if (mission == 2) {
    a = LocaleKeys.math_text.tr();
    return a;
  }
  if (mission == 3) {
    a = LocaleKeys.writing_text.tr();
    return a;
  }
}

Future<void> removeAllHistory() async {
  await db.removeHistoryAll();
}

Duration getDuration(List<DateTime> time) {
  final now = DateTime.now();
  final closetsDateTimeToNow = time.reduce(
      (a, b) => a.difference(now).abs() < b.difference(now).abs() ? a : b);

  return (closetsDateTimeToNow.difference(now));
}

format(Duration d) => d.toString().split('.').first.padLeft(8, "0");


String getMission(int a) {
String b = LocaleKeys.off_text.tr();
if (a == null) {
return b;
}
if (a != null) {
if (a == 1) {
b = LocaleKeys.off_text.tr();
return b;
}
if (a == 2) {
b = LocaleKeys.math_text.tr();
return b;
}
if (a == 3) {
b = LocaleKeys.writing_text.tr();
return b;
}
}
return b;
}