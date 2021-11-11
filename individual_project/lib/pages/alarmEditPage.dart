import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/pages/alarmPage.dart';
import 'package:individual_project/pages/mainPage.dart';
import 'package:individual_project/widgets.dart';

class AlarmEdit extends StatefulWidget {
  const AlarmEdit({Key? key}) : super(key: key);

  @override
  _AlarmEditState createState() => _AlarmEditState();
}

class _AlarmEditState extends State<AlarmEdit> {
  TextEditingController num1controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, right: 5, left: 5),
                  child: Container(
                    width: 382,
                    height: 190,
                    color: Colors.white60,
                    padding: EdgeInsets.only(top: 80),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Center(
                        child: Container(
                          child: CupertinoDatePicker(
                            initialDateTime: DateTime.now(),
                            onDateTimeChanged: (DateTime newdate) {
                              print(newdate);
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
                    width: 382,
                    height: 100,
                    color: Colors.white60,
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
                    width: 382,
                    height: 100,
                    color: Colors.white60,
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
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20, right: 5, left: 5),
                  child: Container(
                    width: 382,
                    height: 100,
                    color: Colors.white60,
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
            Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  TextButton(onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) => MainPage()));
                  }, child: Text("Cancel",style: TextStyle(fontFamily: 'Nexa', fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepOrangeAccent),)),
                  TextButton(onPressed: () {}, child: Text("Done",style: TextStyle(fontFamily: 'Nexa', fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepOrangeAccent),))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
