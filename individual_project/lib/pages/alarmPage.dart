import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/functions/audio.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:individual_project/objects/user.dart';
import 'package:individual_project/services/notification_service.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';
import '../widgets.dart';
import 'alarmAddPage.dart';
import 'package:individual_project/pages/AlarmEditPage.dart';
import 'package:individual_project/widgets.dart';
import "package:easy_localization/easy_localization.dart";

List alarms = <Alarm>[];

class AlarmsList extends StatefulWidget {
  @override
  _AlarmsListState createState() => _AlarmsListState();
}

class _AlarmsListState extends State<AlarmsList> {
  late StreamSubscription<List<Alarm>> alarmStreamSubscription;
  String timeTo = LocaleKeys.no_scheduled_alarms.tr();
  String alarmIn = LocaleKeys.in_text.tr();
  String? b;
  Timer? timer;

  @override
  void dispose() {
    if (alarmStreamSubscription != null) {
      print('unsubscribing');
      alarmStreamSubscription.cancel();
    }

    if(timer!.isActive == false){
      print("Timer canceled");
      timer!.cancel();
    }
    super.dispose();
  }

  Future<void> loadData(AppUser user) async {
    var stream = getAlarms(user);
    alarmStreamSubscription = stream.listen((List<Alarm> data) {
      alarms = data;
    });
  }

  void findNearest() {
    List times = <Timestamp>[];
    List<DateTime> time = <DateTime>[];
    final now = DateTime.now();
    if (alarms != null) {
      for (int i = 0; i < alarms.length; i++) {
        times.add(alarms[i].time);
      }
      for (int b = 0; b < times.length; b++) {
        time.add(times[b].toDate());
      }
    }
    if (time.isNotEmpty) {
      b = format(test(time));
    }
  }

  void timeLeft() {
    if (b != null) {
      if(mounted)setState(() {
      timeTo = '$alarmIn  $b';
      });
    }if(b == null){
      if(mounted)setState(() {
     timeTo =LocaleKeys.no_scheduled_alarms.tr();
    });
    }
  }
  @override
  void initState() {
    startTimer();
    super.initState();
  }
  void startTimer(){
    timer = Timer.periodic(Duration(seconds: 1),(_){
      findNearest();
      timeLeft();
    });
  }

  @override
  Widget build(BuildContext context) {
    AudioService.stopAudio();
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;
    AppUser user = Provider.of<AppUser>(context);
    loadData(user);
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
                          padding: EdgeInsets.only(
                              top: paddHeight * 0.1, left: 10, bottom: 3),
                          child: Text(
                            LocaleKeys.next_alarm_text.tr(),
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
                            timeTo,
                            style: TextStyle(
                                fontFamily: 'NexaXBold',
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          )),
                    ],
                  ),
                  Expanded(
                    child: MediaQuery.removePadding(
                      context: context,
                      removeTop: true,
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Alarms')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return ListView.builder(
                              itemCount: alarms.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                    key: UniqueKey(),
                                    onDismissed: (direction) {
                                      timer!.cancel();
                                      NotificationService.removeNotification(
                                          alarms[index]);
                                      removeAlarm(alarms[index]);
                                      setState(() {
                                        alarms.removeAt(index);
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 5),
                                      child: GestureDetector(
                                        onTap: () {
                                          open(alarms[index]);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      AlarmEdit()));
                                        },
                                        child: Card(
                                            color: Colors.white60,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            elevation: 10,
                                            child: Container(
                                              height: size.height * 0.15,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                top: 20),
                                                        height:
                                                            size.height * 0.07,
                                                        width: size.width * 0.6,
                                                        child: Text(
                                                          dateFormat(
                                                                  alarms[index]
                                                                      .time,
                                                                  context.locale
                                                                      .toString())
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Nexa",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 30,
                                                              foreground: Paint()
                                                                ..shader =
                                                                    linearGradient),
                                                        ),
                                                      ),
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                top:
                                                                    paddHeight *
                                                                        0.045),
                                                        width:
                                                            size.width * 0.35,
                                                        transformAlignment:
                                                            Alignment
                                                                .centerRight,
                                                        child: CupertinoSwitch(
                                                          value: alarms[index]
                                                              .status,
                                                          onChanged: (value) {
                                                            if (value == true) {
                                                              NotificationService
                                                                  .showNotification(
                                                                      alarms[
                                                                          index]);
                                                            }
                                                            if (value ==
                                                                false) {
                                                              NotificationService
                                                                  .removeNotification(
                                                                      alarms[
                                                                          index]);
                                                            }
                                                            setState(
                                                              () {
                                                                alarms[index]
                                                                        .status =
                                                                    value;
                                                                editAlarm(
                                                                    alarms[
                                                                        index]);
                                                              },
                                                            );
                                                          },
                                                          activeColor:
                                                              Colors.green,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left:
                                                                    paddWidth *
                                                                        0.06),
                                                        child: Text(
                                                          alarms[index]
                                                              .label
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  'Nexa',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
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
                                      ),
                                    ),
                                    background: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red.withOpacity(0.5),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                    ));
                              });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
      floatingActionButton: Container(
        padding: EdgeInsets.only(bottom: size.height * 0.1),
        child: FloatingActionButton(
            child: Icon(Icons.add, size: 35),
            backgroundColor: Colors.deepOrangeAccent,
            foregroundColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => AlarmAdd()));
            }),
      ),
    );
  }
}
