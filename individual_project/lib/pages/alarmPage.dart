import 'package:flutter/material.dart';
import 'package:individual_project/main.dart';
import 'package:expansion_card/expansion_card.dart';
import 'package:android_alarm_manager/android_alarm_manager.dart';


class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
          child: ExpansionCard(
                  borderRadius: 20,
                  background: Image.asset(
                    "assets/mountains.png",
                    fit: BoxFit.cover,
                  ),
                  title: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Header",
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "Sub",
                          style: TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 7),
                      child: Text("Content goes over here !",
                          style: TextStyle(fontSize: 20, color: Colors.black)),
                    )
                  ],
                ),


    ),floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: 80),
      child: FloatingActionButton(
          backgroundColor: Colors.deepOrangeAccent,
          onPressed: (){
            AndroidAlarmManager.oneShot(Duration(seconds: 5),1,fireAlarm);
          },
        ),
    ),
      )
        );
  }
}

void fireAlarm(){
  print('Alarm fired at ${DateTime.now()}');
}
