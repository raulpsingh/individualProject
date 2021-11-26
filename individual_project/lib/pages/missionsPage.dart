import 'dart:ui';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:individual_project/objects/missionObject.dart';
import 'package:individual_project/pages/mathMissionPage.dart';
import 'package:individual_project/pages/writingMissionPage.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'alarmAddPage.dart';

int missionInt =1;
class MissionsPage extends StatefulWidget {
  const MissionsPage({Key? key}) : super(key: key);

  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
  @override
  Widget build(BuildContext context) {
    Border _bordermath = Border();
    Border _borderWriting = Border();
    Border _borderOff = Border();
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;


   void changeBorder(){
     missionInt= MissionHelper.getMissionInt();
      setState(() {
      if(missionInt==1){
        _borderOff= Border.all(color: Colors.white,width: 3);
      }if(missionInt==2){
        _bordermath= Border.all(color: Colors.white,width: 3);
      }if(missionInt==3){
        _borderWriting= Border.all(color: Colors.white,width: 3);
      }
      });
    }
    changeBorder();
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
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: paddHeight * 0.1, left: 5),
                child: Row(children: [
                  Container(
                    child: Text(
                      LocaleKeys.choose_mission_text.tr(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "NexaXBold",
                          color: Colors.black),
                    ),
                  )
                ]),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: paddHeight * 0.05, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(builder: (context) => MathMissionPage()),
                        );
                      },
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: _bordermath,
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calculate_outlined,
                                    size: 50,
                                    color: Colors.deepOrangeAccent,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 9),
                              child: Row(
                                children: [
                                  Text(
                                    LocaleKeys.math_text.tr(),
                                    style: TextStyle(
                                        fontFamily: "NexaXBold",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute<void>(builder: (context) => WritingMissionPage()));
                      },
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.2,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: _borderWriting,
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.note_alt_outlined,
                                    size: 50,
                                    color: Colors.deepOrangeAccent,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 9),
                              child: Row(
                                children: [
                                  Text(
                                    LocaleKeys.writing_text.tr(),
                                    style: TextStyle(
                                        fontFamily: "NexaXBold",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: paddHeight * 0.01, left: 5, right: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        MissionHelper.addToMissionOnlyMission(1);
                        changeBorder();
                      },
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: _borderOff,
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.alarm_outlined,
                                    size: 50,
                                    color: Colors.deepOrangeAccent,
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 13),
                              child: Row(
                                children: [
                                  Text(
                                    LocaleKeys.off_text.tr(),
                                    style: TextStyle(
                                        fontFamily: "NexaXBold",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: size.width * 0.47,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white38),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Padding(
                  padding:  EdgeInsets.only(top: paddHeight*0.1),
                  child: TextButton(onPressed: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => AlarmAdd()));
                  },
                        child: Container(
                          height: size.height*0.08,
                          width: size.width*0.4,
                          child: Center(
                            child: Text(
                              LocaleKeys.done_text.tr(),
                              style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,fontFamily: "NexaXBold", color: Colors.white),
                            ),
                          ),

                        ),
                      ),
                )
              ],)
            ],
          ),
        ),
      ),
    );
  }
}
