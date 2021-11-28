import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/functions/widgets.dart';
import 'package:individual_project/pages/missionsEditPage.dart';
import 'package:individual_project/services/database_service.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:individual_project/objects/user.dart';
import 'package:individual_project/pages/mainPage.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

DateTime time = DateTime.now();
DateTime _time = DateTime.now();
late Timestamp vs;
late String uid;
late Alarm alarm;
late String label;
late int mission;
void open(Alarm a) {
  alarm = a;
  uid = a.uid!;
  vs = a.time;
  time = a.time.toDate();
  label = a.label!;
  mission = a.mission;
}

DataBaseService db = DataBaseService();

class AlarmEdit extends StatefulWidget {
  const AlarmEdit({Key? key}) : super(key: key);

  @override
  _AlarmEditState createState() => _AlarmEditState();
}

class _AlarmEditState extends State<AlarmEdit> {
  TextEditingController num1controller = TextEditingController(text: label);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;
    AppUser? user = Provider.of<AppUser?>(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(top: paddHeight * 0.1, right: 5, left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20)),
                    width: size.width * 0.97,
                    height: size.height * 0.2,
                    padding: EdgeInsets.only(),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Center(
                        child: Container(
                          child: CupertinoDatePicker(
                            initialDateTime: time,
                            onDateTimeChanged: (datetime) {
                              setState(() {
                                _time = datetime;
                                print(datetime);
                              });
                            },
                            use24hFormat: true,
                            mode: CupertinoDatePickerMode.time,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20)),
                    width: size.width * 0.97,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: size.width * 0.45,
                            child: Text(
                              LocaleKeys.label_text.tr(),
                              style: TextStyle(
                                  fontFamily: "Nexa",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(),
                            child: SizedBox(
                              width: size.width * 0.45,
                              child: TextField(
                                cursorColor: Colors.deepOrangeAccent,
                                decoration: InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                            color: Colors.deepOrangeAccent)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.deepOrangeAccent),
                                        borderRadius:
                                            BorderRadius.circular(5))),
                                keyboardType: TextInputType.text,
                                controller: num1controller,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                              builder: (context) => MissionsEditPage()));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(20)),
                      width: size.width * 0.97,
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Row(
                          children: <Widget>[
                            Text(
                              LocaleKeys.mission_text.tr(),
                              style: TextStyle(
                                  fontFamily: "Nexa",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: paddWidth * 0.43),
                              child: Text(
                                getMission(mission),
                                style: TextStyle(
                                  fontFamily: "NexaXBold",
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  foreground: Paint()..shader = linearGradient,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.circular(20)),
                    width: size.width * 0.97,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                         LocaleKeys.sound_text.tr(),
                            style: TextStyle(
                              fontFamily: "Nexa",
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: paddWidth * 0.5),
                            child: Text(
                              "Sound",
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: "NexaXBold",
                                foreground: Paint()..shader = linearGradient,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: paddHeight * 0.05),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => MainPage()));
                      },
                      child: Text(
                        LocaleKeys.cancel_text.tr(),
                        style: TextStyle(
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          foreground: Paint()..shader = linearGradient,
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        String label = num1controller.text;
                        editAlarm(alarm, label, _time);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => MainPage()));
                      },
                      child: Text(
                        LocaleKeys.done_text.tr(),
                        style: TextStyle(
                          fontFamily: 'Nexa',
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          foreground: Paint()..shader = linearGradient,
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
