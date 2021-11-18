import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:individual_project/services/database_service.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Scaffold(
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
                  padding:  EdgeInsets.only(top: paddHeight * 0.1),
                  child: Container(
                    height: 150,
                    color: Colors.white24,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10 ),
                      child: Row(
                        children: [
                          Text(
                            "Settings",
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'NexaXBold',
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Row(children: [
                    Container(
                      width: size.width*0.97,
                      height: 80,
                      color: Colors.white24,
                      child: TextButton(
                        style: ButtonStyle(
                            overlayColor: MaterialStateProperty.all(
                                Colors.deepOrangeAccent.withOpacity(0.5))),
                        onPressed: () {},
                        child: Container(
                          width: 390,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 2, right: 5, left: 5),
                                  child: Icon(
                                    Icons.quiz,
                                    color: Colors.deepOrangeAccent,
                                  ),
                                ),
                                Text(
                                  "FAQ",
                                  style: TextStyle(
                                      fontFamily: 'Nexa',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                      color: Colors.deepOrangeAccent),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                Row(children: [
                  Container(
                    width: size.width*0.97,
                    height: 80,
                    color: Colors.white24,
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Colors.deepOrangeAccent.withOpacity(0.5))),
                      onPressed: () {},
                      child: Container(
                        width: size.width*0.97,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 2, right: 5, left: 5),
                                child: Icon(
                                  Icons.message,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                              Text(
                                "Send Feedback",
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.deepOrangeAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
                Row(children: [
                  Container(
                    width: size.width*0.97,
                    height: 80,
                    color: Colors.white24,
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Colors.deepOrangeAccent.withOpacity(0.5))),
                      onPressed: () {},
                      child: Container(
                        width: size.width*0.97,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 2, right: 5, left: 5),
                                child: Icon(
                                  Icons.language,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                              Text(
                                "Language",
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.deepOrangeAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ]),
                Row(children: [
                  Container(
                    width: size.width*0.97,
                    height: 80,
                    color: Colors.white24,
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Colors.deepOrangeAccent.withOpacity(0.5))),
                      onPressed: () {
                        AuthService().logOut();
                      },
                      child: Container(
                        width: 390,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 2, right: 5, left: 8),
                                child: Icon(
                                  Icons.logout,
                                  color: Colors.deepOrangeAccent,
                                ),
                              ),
                              Text(
                                "Log out",
                                style: TextStyle(
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.deepOrangeAccent),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
