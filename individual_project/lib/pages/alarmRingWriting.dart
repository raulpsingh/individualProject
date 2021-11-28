import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:individual_project/functions/audio.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/functions/phrases.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'package:individual_project/functions/timer.dart';
import 'package:individual_project/objects/historyObject.dart';

class RingWriting extends StatefulWidget {
  final Alarm? alarm;
  const RingWriting({Key? key, required this.alarm}) : super(key: key);

  @override
  _RingWritingState createState() => _RingWritingState();
}

class _RingWritingState extends State<RingWriting> {
  int a = 1;
  String? phrase;
  TextEditingController _phraseController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;

    bool? checkPhrase() {
      if (_phraseController.text == phrase) {
        return true;
      } else
        return false;
    }

    void getPhrase() {
      if (phrase == null) {
        phrase = generatePhrase(widget.alarm)!;
      }
    }

    void getNewPhrase() {
      setState(() {
        phrase = generatePhrase(widget.alarm);
      });
    }

    getPhrase();
    return Container(
      color: Colors.grey,
      child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: AssetImage('assets/mountain.png')),
          ),
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Scaffold(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  resizeToAvoidBottomInset: true,
                  body: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: paddHeight * 0.2),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: size.height * 0.2,
                              width: size.width * 0.97,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white38),
                              child: Padding(
                                padding: EdgeInsets.only(
                                    left: paddWidth * 0.03,
                                    right: paddWidth * 0.03),
                                child: Center(
                                    child: Text(
                                  phrase!,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: "NexaXBold",
                                      color: Colors.deepOrangeAccent),
                                )),
                              ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            height: size.height * 0.15,
                            decoration: BoxDecoration(color: Colors.white54),
                            child: Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: paddWidth * 0.03),
                                  child: SizedBox(
                                    width: size.width * 0.8,
                                    child: TextField(
                                      textCapitalization:
                                          TextCapitalization.sentences,
                                      controller: _phraseController,
                                      style: TextStyle(fontSize: 20),
                                      maxLines: null,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText: 'Type here',
                                        contentPadding: EdgeInsets.fromLTRB(
                                            5.0, 20.0, 5.0, 20.0),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors.deepOrangeAccent,
                                                width: 3)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: BorderSide(
                                                color: Colors.orange,
                                                width: 3)),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: size.width * 0.15,
                                  height: size.height * 0.15,
                                  child: TextButton(
                                    onPressed: () {
                                      setState(() {
                                        int? b = widget.alarm!.numberOfProblems;
                                        if (a < b!) {
                                          if (checkPhrase() == true) {
                                            phrase = "";
                                            getNewPhrase();
                                            a++;
                                            _phraseController.clear();
                                          } else if (checkPhrase() == false) {
                                            showToast(
                                              LocaleKeys.you_answer_wrong_text
                                                  .tr(),
                                              textStyle: TextStyle(
                                                  color: Colors.white),
                                              backgroundColor:
                                                  Colors.deepOrangeAccent,
                                              context: context,
                                              animation:
                                                  StyledToastAnimation.scale,
                                              reverseAnimation:
                                                  StyledToastAnimation.fade,
                                              position:
                                                  StyledToastPosition.center,
                                              animDuration:
                                                  Duration(seconds: 1),
                                              duration: Duration(seconds: 4),
                                              curve: Curves.elasticOut,
                                              reverseCurve: Curves.linear,
                                            );
                                            print("false");
                                          }
                                        } else if (a >= b) {
                                          if (checkPhrase() == true) {
                                            print("true");
                                            TimerCountUp.stopTimer();
                                            int? timer =
                                                TimerCountUp.getTimerTime();
                                            History a = History(
                                                author: widget.alarm!.author,
                                                mission: widget.alarm!.mission,
                                                time: widget.alarm!.time,
                                                timer: timer!);
                                            addHistory(a);
                                            Alarm toRemove = widget.alarm!;
                                            removeAlarm(toRemove);
                                            AudioService.stopAudio();
                                            Navigator.of(context).popUntil(
                                                (route) => route.isFirst);
                                          } else if (checkPhrase() == false) {
                                            print("false");
                                            showToast(
                                              LocaleKeys.you_answer_wrong_text
                                                  .tr(),
                                              textStyle: TextStyle(
                                                  color: Colors.white),
                                              backgroundColor:
                                                  Colors.deepOrangeAccent,
                                              context: context,
                                              animation:
                                                  StyledToastAnimation.scale,
                                              reverseAnimation:
                                                  StyledToastAnimation.fade,
                                              position:
                                                  StyledToastPosition.center,
                                              animDuration:
                                                  Duration(seconds: 1),
                                              duration: Duration(seconds: 4),
                                              curve: Curves.elasticOut,
                                              reverseCurve: Curves.linear,
                                            );
                                          }
                                        }
                                      });
                                    },
                                    child: Icon(
                                      Icons.send,
                                      size: 35,
                                      color: Colors.deepOrangeAccent,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )))),
    );
  }
}
