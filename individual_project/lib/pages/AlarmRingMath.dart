import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:individual_project/functions/audio.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/functions/randomExamples.dart';

class RingMath extends StatefulWidget {
  const RingMath({Key? key}) : super(key: key);

  @override
  _RingMathState createState() => _RingMathState();
}

class _RingMathState extends State<RingMath> {
  String _result = "";
  List? _example = generateEasyMath();
  bool? checkResult() {
    int num1 = int.parse(_example![0]);
    int num2 = int.parse(_example![2]);
    if (_example![1] == "+") {
      int _checkResult = num1 + num2;
      print(_checkResult.toString());
      if (int.parse(_result) == _checkResult) {
        return true;
      } else
        return false;
    }
    if (_example![1] == "-") {
      int _checkResult = num1 - num2;
      print(_checkResult.toString());
      if (int.parse(_result) == _checkResult) {
        return true;
      } else
        return false;
    }
  }

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
                  padding:  EdgeInsets.only(top: paddHeight *0.25),
                  child: Container(
                    width: 180,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          correction(_example.toString()),
                          style: TextStyle(
                              fontFamily: "NexaXBold",
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.deepOrangeAccent),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: paddHeight *0.03),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white30,
                    ),
                    width: size.width*0.6,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Text(
                            "=",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: paddWidth * 0.01),
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white12,
                                  border: Border.all(
                                      color: Colors.deepOrangeAccent,
                                      width: 3)),
                              width: paddWidth*0.45,
                              height: paddHeight*0.45,
                              padding: EdgeInsets.only(left: 50),
                              child: Text(
                                _result,
                                style: TextStyle(
                                    fontSize: 50,
                                    color: Colors.deepOrangeAccent),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(top:paddHeight*0.11),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        color: Colors.white60,
                        height: 97,
                        width: size.width *0.25,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (_result.length < 2) {
                                _result = _result + "1";
                              }
                            });
                          },
                          child: Text("1",
                              style: TextStyle(
                                  fontFamily: "NexaXBold",
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent)),
                        ),
                      ),
                      Container(
                        height: 97,
                        width: size.width *0.25,
                        color: Colors.white60,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (_result.length < 2) {
                                _result = _result + "2";
                              }
                            });
                          },
                          child: Text("2",
                              style: TextStyle(
                                  fontFamily: "NexaXBold",
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent)),
                        ),
                      ),
                      Container(
                        height: 97,
                        width: size.width *0.25,
                        color: Colors.white60,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              if (_result.length < 2) {
                                _result = _result + "3";
                              }
                            });
                          },
                          child: Text("3",
                              style: TextStyle(
                                  fontFamily: "NexaXBold",
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrangeAccent)),
                        ),
                      ),
                      Container(
                        height: 97,
                        width: size.width *0.25,
                        color: Colors.red.withOpacity(0.2),
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                if (_result != null && _result.length > 0) {
                                  _result =
                                      _result.substring(0, _result.length - 1);
                                }
                              });
                            },
                            child: Icon(Icons.undo_outlined,
                                color: Colors.deepOrangeAccent, size: 50)),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.white60,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_result.length < 2) {
                              _result = _result + "4";
                            }
                          });
                        },
                        child: Text("4",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ),
                    ),
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.white60,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_result.length < 2) {
                              _result = _result + "5";
                            }
                          });
                        },
                        child: Text("5",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ),
                    ),
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.white60,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_result.length < 2) {
                              _result = _result + "6";
                            }
                          });
                        },
                        child: Text("6",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ),
                    ),
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.green.withOpacity(0.4),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (checkResult() == true) {
                              print("true");
                              AudioService.stopAudio();
                              Navigator.of(context).popUntil((route) => route.isFirst);
                            }
                            if (checkResult() == false) {
                              showToast(
                                'Your answer is wrong',
                                textStyle: TextStyle(color: Colors.white),
                                backgroundColor: Colors.deepOrangeAccent,
                                context: context,
                                animation: StyledToastAnimation.scale,
                                reverseAnimation: StyledToastAnimation.fade,
                                position: StyledToastPosition.center,
                                animDuration: Duration(seconds: 1),
                                duration: Duration(seconds: 4),
                                curve: Curves.elasticOut,
                                reverseCurve: Curves.linear,
                              );
                              print("false");
                            }
                          });
                        },
                        child: Icon(
                          Icons.navigate_next_outlined,
                          color: Colors.deepOrangeAccent,
                          size: 50,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.white60,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_result.length < 2) {
                              _result = _result + "7";
                            }
                          });
                        },
                        child: Text("7",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ),
                    ),
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.white60,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_result.length < 2) {
                              _result = _result + "8";
                            }
                          });
                        },
                        child: Text("8",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ),
                    ),
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.white60,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_result.length < 2) {
                              _result = _result + "9";
                            }
                          });
                        },
                        child: Text("9",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ),
                    ),
                    Container(
                      height: 98,
                      width: size.width *0.25,
                      color: Colors.white60,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            if (_result.length < 2) {
                              _result = _result + "0";
                            }
                          });
                        },
                        child: Text("0",
                            style: TextStyle(
                                fontFamily: "NexaXBold",
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepOrangeAccent)),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
