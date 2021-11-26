import 'package:flutter/material.dart';
import 'package:individual_project/functions/audio.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:individual_project/pages/AlarmRingMath.dart';
import 'package:individual_project/pages/alarmPage.dart';
import 'package:individual_project/pages/alarmRingWriting.dart';
import 'package:individual_project/functions/timer.dart';
import 'package:individual_project/objects/historyObject.dart';

class RingPage extends StatelessWidget {
  final String? payload;
  const RingPage({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Alarm? alarm;

    Alarm? findAlarm() {
      int id = int.parse(payload!);
      for (var i = 0; i < alarms.length; i++) {
        if (alarms[i].id == id) {
          alarm = alarms[i];
          return alarm;
        }
      }
    }

    AudioService.openingActions();
    TimerCountUp.startTimer();
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
                padding: EdgeInsets.only(bottom: 230),
                child: Container(
                  child: Text('Wake Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                          fontFamily: "NexaXBold",
                          color: Colors.deepOrangeAccent)),
                )),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Container(
                width: 200,
                height: 70,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.deepOrangeAccent),
                child: TextButton(
                  onPressed: () {
                    if (decide(findAlarm()) == 1) {
                      TimerCountUp.stopTimer();
                      int? timer = TimerCountUp.getTimerTime();
                      History a = History(
                          author: alarm!.author,
                          mission: alarm!.mission,
                          time: alarm!.time,
                          timer: timer!);
                      addHistory(a);
                      AudioService.stopAudio();
                      Alarm toRemove = alarm!;
                      removeAlarm(toRemove);
                      Navigator.pop(context);
                    }
                    if (decide(findAlarm()) == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => RingMath(
                                    alarm: alarm,
                                  )));
                    }
                    if (decide(findAlarm()) == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => RingWriting(alarm: alarm)));
                    }
                  },
                  child: Text(
                    "Stop alarm",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        fontFamily: "NexaXBold",
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
