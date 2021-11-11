import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/main.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:individual_project/functions/alarmObject.dart';

import '../widgets.dart';
import 'alarmEditPage.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlarmsList();

    /* floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80),
      child: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: (){
            AndroidAlarmManager.oneShot(Duration(seconds: 5),1,fireAlarm);
          },
        ),
    ),*/
  }
}

void fireAlarm() {
  print('Alarm fired at ${DateTime.now()}');
}

class AlarmsList extends StatefulWidget {

  @override
  _AlarmsListState createState() => _AlarmsListState();
}


class _AlarmsListState extends State<AlarmsList> {
  final alarms = <Alarm>[
    Alarm(label: "Alarm1", time: DateTime.now(), status: true),
    Alarm(label: "Alarm2", time: DateTime.now(), status: true),
    Alarm(label: "Alarm3", time: DateTime.now(), status: true),
    Alarm(label: "Alarm4", time: DateTime.now(), status: true),
    Alarm(label: "Alarm5", time: DateTime.now(), status: true),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.grey,
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.4), BlendMode.dstATop),
                  image: AssetImage('assets/mountain.png')),
            ),
            child: Container(
              padding: EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                          padding:
                              EdgeInsets.only(top: 80, left: 10, bottom: 3),
                          child: Text(
                            "Next alarm",
                            style: TextStyle(
                                fontFamily: 'Nexa',
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          )),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                          padding:
                              EdgeInsets.only(top: 1, left: 10, bottom: 10),
                          child: Text(
                            "No scheduled alarm",
                            style: TextStyle(
                                fontFamily: 'Nexa',
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          )),
                    ],
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: ListView.builder(
                          itemCount: alarms.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 5, right: 5),
                              child: Card(
                                  color: Colors.white60,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  elevation: 10,
                                  child: Container(
                                    height: 100,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding: EdgeInsets.only(
                                                  left: 20, top: 20),
                                              height: 50,
                                              width: 250,
                                              child: Text(
                                                dateFormat(alarms[index].time)
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: "Nexa",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 30,
                                                    foreground: Paint()
                                                      ..shader =
                                                          linearGradient),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 28),
                                              width: 122,
                                              transformAlignment:
                                                  Alignment.centerRight,
                                              child: CupertinoSwitch(
                                                value: alarms[index].status,
                                                onChanged: (value) {
                                                  setState(() {

                                                  alarms[index].status=value;
                                                  },);
                                                },
                                                activeColor: Colors.green,
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Text(
                                                alarms[index].label,
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontFamily: 'Nexa',
                                                    fontWeight: FontWeight.bold,
                                                    foreground: Paint()
                                                      ..shader =
                                                          linearGradient),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            ),
          )),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 60),
        child: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.deepOrangeAccent,
          foregroundColor: Colors.white,
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (ctx) => AlarmEdit()));

    },
    ),
      ),


    );
  }
}
