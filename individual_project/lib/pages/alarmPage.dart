import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/databases/database_service.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:individual_project/objects/user.dart';
import 'package:provider/provider.dart';
import '../widgets.dart';
import 'alarmAddPage.dart';
import 'package:individual_project/pages/AlarmEditPage.dart';
import 'package:individual_project/widgets.dart';

class AlarmPage extends StatelessWidget {
  const AlarmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlarmsList();
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
  List alarms = <Alarm>[];
  DataBaseService db = DataBaseService();
  late StreamSubscription<List<Alarm>> alarmStreamSubscription;
  @override

  void dispose() {
    if (alarmStreamSubscription != null) {
      print('unsubscribing');
      alarmStreamSubscription.cancel();
    }
    super.dispose();
  }

  Future<void> loadData(AppUser user) async {
    var stream = db.getAlarms(user.id);
    alarmStreamSubscription = stream.listen((List<Alarm> data) {
      alarms = data;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                            'No scheduled alarms',
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
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('Alarms')
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          if (!snapshot.hasData) return Text("No records");
                          return ListView.builder(
                              itemCount: alarms.length,
                              itemBuilder: (context, index) {
                                return Dismissible(
                                    key: UniqueKey(),
                                    onDismissed: (direction) {
                                      db.removeAlarm(alarms[index]);
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
                                              height: 100,
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: <Widget>[
                                                      Container(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                top: 20),
                                                        height: 50,
                                                        width: 250,
                                                        child: Text(
                                                          dateFormat(
                                                                  alarms[index]
                                                                      .time)
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
                                                                top: 28),
                                                        width: 122,
                                                        transformAlignment:
                                                            Alignment
                                                                .centerRight,
                                                        child: CupertinoSwitch(
                                                          value: alarms[index]
                                                              .status,
                                                          onChanged: (value) {
                                                            setState(
                                                              () {
                                                                alarms[index]
                                                                        .status =
                                                                    value;
                                                                db.addAndEditAlarms(
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
                                                                left: 20),
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
        padding: EdgeInsets.only(bottom: 60),
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
