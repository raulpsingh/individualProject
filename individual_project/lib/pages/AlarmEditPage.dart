import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/databases/database_service.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/objects/user.dart';
import 'package:individual_project/pages/mainPage.dart';
import 'package:individual_project/widgets.dart';
import 'package:provider/provider.dart';

DateTime time=DateTime.now() ;
DateTime _time=DateTime.now();
late Timestamp vs;
late String uid;
late Alarm alarm;
late String label;
void open(Alarm a) {
  alarm=a;
  uid=a.uid!;
  vs =a.time;
  time=a.time.toDate();
  label = a.label! ;
}
DataBaseService db =DataBaseService();

class AlarmEdit extends StatefulWidget {
  const AlarmEdit({Key? key}) : super(key: key);

  @override
  _AlarmEditState createState() => _AlarmEditState();
}

class _AlarmEditState extends State<AlarmEdit> {

  TextEditingController num1controller = TextEditingController(text: label);




  @override
  Widget build(BuildContext context) {
    AppUser? user= Provider.of<AppUser?>(context);

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
                  padding: const EdgeInsets.only(top: 80, right: 5, left: 5),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20) ),
                    width: 382,
                    height: 190,
                    padding: EdgeInsets.only(top: 80),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Center(
                        child: Container(
                          child: CupertinoDatePicker(
                            initialDateTime: time,
                            onDateTimeChanged: (datetime) {
                              setState(() {
                                _time = datetime ;
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
                    decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20) ),
                    width: 382,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Label",
                            style: TextStyle(
                                fontFamily: "Nexa",
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 100),
                            child: SizedBox(
                              width: 200,
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
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20) ),
                    width: 382,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Mission",
                            style: TextStyle(
                                fontFamily: "Nexa",
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 220),
                            child: DropDown(),
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
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white60,borderRadius: BorderRadius.circular(20) ),
                    width: 382,
                    height: 100,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Sound",
                            style: TextStyle(
                                fontFamily: "Nexa",
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 220),
                            child: DropDown(),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (ctx) => MainPage()));
                      },
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            fontFamily: 'Nexa',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepOrangeAccent),
                      )),
                  TextButton(
                      onPressed: () {
                        Timestamp stamp = Timestamp.fromDate(_time);
                        if (vs != stamp){
                          alarm.time=stamp;
                          db.editAlarms(alarm, uid);

                        }
                        if(alarm.label != num1controller.text){
                          alarm.label=num1controller.text;
                          db.editAlarms(alarm, uid);
                        }
                        Navigator.push(
                            context, MaterialPageRoute(builder: (ctx) => MainPage()));


                      },
                      child: Text(
                        "Done",
                        style: TextStyle(
                            fontFamily: 'Nexa',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.deepOrangeAccent),
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
