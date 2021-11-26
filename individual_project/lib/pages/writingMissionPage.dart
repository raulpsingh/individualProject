import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/objects/missionObject.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'missionsPage.dart';

double value = 1;
String level = LocaleKeys.short_text.tr();
List items = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'];
int index = 0;
List missions = <Mission>[];
class WritingMissionPage extends StatefulWidget {
  const WritingMissionPage({Key? key}) : super(key: key);

  @override
  _WritingMissionPageState createState() => _WritingMissionPageState();
}

class _WritingMissionPageState extends State<WritingMissionPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;
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
                      child: Row(
                        children: [
                          Text(
                            LocaleKeys.choose_writing_mission_text.tr(),
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: paddHeight * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width * 0.97,
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Column(
                              children: [
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: paddHeight * 0.05),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        LocaleKeys.length_text.tr(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "NexaXBold",
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 25),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: paddHeight * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        level,
                                        style: TextStyle(
                                            fontFamily: "NexaXBold",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding:
                                  EdgeInsets.only(top: paddHeight * 0.03),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                    children: [
                                      SizedBox(
                                        width: size.width * 0.95,
                                        child: Slider(
                                            value: value,
                                            min: 1,
                                            max: 3,
                                            divisions: 2,
                                            activeColor: Colors.deepOrangeAccent,
                                            inactiveColor: Colors.orange.shade50,
                                            onChanged: (_value) {
                                              setState(() {
                                                value = _value;
                                                if (value == 1) {
                                                  level = LocaleKeys.short_text.tr();
                                                }
                                                if (value == 2) {
                                                  level = LocaleKeys.normal_text.tr();
                                                }
                                                if (value == 3) {
                                                  level = LocaleKeys.long_text.tr();
                                                }
                                              });
                                            }
                                      )
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: paddHeight * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            width: size.width * 0.97,
                            height: size.height * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white),
                            child: Column(children: [
                              Padding(
                                padding: EdgeInsets.only(top: paddHeight * 0.02),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      LocaleKeys.number_of_phrases_text.tr(),
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontFamily: "NexaXBold",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.deepOrangeAccent),
                                    )
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.8,
                                    height: size.width * 0.4,
                                    child: CupertinoPicker(
                                        itemExtent: 64,
                                        onSelectedItemChanged: (_index) {
                                          setState(() {
                                            index = _index;
                                          });
                                        },
                                        children: items
                                            .map((item) => Center(
                                            child: Text(
                                              item,
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "NexaXBold"),
                                            )))
                                            .toList()),
                                  )
                                ],
                              )
                            ]),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: paddHeight * 0.05),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                LocaleKeys.cancel_text.tr(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "NexaXBold",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                          Container(
                            child: TextButton(
                              onPressed: () {
                                MissionHelper.addToMissionFull(
                                    3, int.parse(items[index]), value.toInt());
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (ctx) => MissionsPage()));
                              },
                              child: Text(
                                LocaleKeys.done_text.tr(),
                                style: TextStyle(
                                    fontSize: 25,
                                    fontFamily: "NexaXBold",
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    )



                  ],
                ))));
  }
}
