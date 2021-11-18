import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:individual_project/objects/user.dart';
import 'package:provider/provider.dart';

class MissionsPage extends StatefulWidget {
  const MissionsPage({Key? key}) : super(key: key);

  @override
  _MissionsPageState createState() => _MissionsPageState();
}

class _MissionsPageState extends State<MissionsPage> {
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
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: paddHeight * 0.1, left: 5),
                child: Row(children: [
                  Container(
                    child: Text(
                      "Choose a mission",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          fontFamily: "NexaXBold",
                          color: Colors.deepOrangeAccent),
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
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.calculate_outlined,
                                    size: 60,
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
                                    "Math",
                                    style: TextStyle(
                                        fontFamily: "NexaXBold",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: size.width * 0.47,
                        height: size.height * 0.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white38),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 5, top: 5),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.note_alt_outlined,
                                    size: 60,
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
                                    "Writing",
                                    style: TextStyle(
                                        fontFamily: "NexaXBold",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepOrangeAccent),
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
                    Container(
                      width: size.width * 0.47,
                      height: size.height * 0.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white38),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
