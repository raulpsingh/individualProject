import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/services/database_service.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'package:individual_project/widgets.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;
    Border _borderEn = Border();
    Border _borderRu = Border();
    String _localeNow;
    String _locale = context.locale.toString();
    _localeNow = _locale;
    void changeLocale(String _locale) {
      setState(() {
        if (_locale == "en") {
          _localeNow = "en";
          context.setLocale(
            Locale('en'),
          );
        }
        if (_locale == "ru") {
          _localeNow = "ru";
          context.setLocale(
            Locale('ru'),
          );
        }
      });
    }

    void changeBorder() {
      setState(() {
        if (_localeNow == "en") {
          _borderEn = Border.all(color: Colors.deepOrangeAccent, width: 3);
          _borderRu = Border();
        }
        if (_localeNow == "ru") {
          _borderRu = Border.all(color: Colors.deepOrangeAccent, width: 3);
          _borderEn = Border();
        }
      });
    }

    changeBorder();
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
                  padding: EdgeInsets.only(
                      top: paddHeight * 0.1),
                  child: Row(
                    mainAxisAlignment : MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(20) ), color: Colors.white12,),
                        width: size.width * 0.97,
                        height: size.height*0.1,
                        padding: EdgeInsets.only(left: paddWidth*0.03,top: paddHeight*0.03),
                        child: Text(
                          LocaleKeys.setting_text.tr(),
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'NexaXBold',
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                    Container(
                      width: size.width * 0.97,
                      height: size.height*0.1,
                      color: Colors.white12,
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
                                  LocaleKeys.faq_text.tr(),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  Container(
                    width: size.width * 0.97,
                    height: size.height*0.1,
                    color: Colors.white12,
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Colors.deepOrangeAccent.withOpacity(0.5))),
                      onPressed: () {},
                      child: Container(
                        width: size.width * 0.97,
                        height: size.height*0.1,
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
                                LocaleKeys.send_feedback_text.tr(),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  Container(
                    width: size.width * 0.97,
                    height: size.height*0.1,
                    color: Colors.white12,
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Colors.deepOrangeAccent.withOpacity(0.5))),
                      onPressed: () {
                        showDialog<String>(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                  builder: (context, StateSetter setState) {
                                return AlertDialog(
                                  backgroundColor: Colors.white60,
                                  title: Text(
                                      LocaleKeys.select_language_text.tr()),
                                  actions: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        GestureDetector(
                                          child: Container(
                                            height: size.height * 0.1,
                                            width: size.width * 0.7,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.white60,
                                                border: _borderRu),
                                            child: Center(
                                                child: Text(
                                              "Русский",
                                              style: TextStyle(
                                                  fontFamily: "NexaXBold",
                                                  fontSize: 20,
                                                  color:
                                                      Colors.deepOrangeAccent,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              changeLocale("ru");
                                              changeBorder();
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          top: paddHeight * 0.03),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          GestureDetector(
                                            child: Container(
                                              height: size.height * 0.1,
                                              width: size.width * 0.7,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  color: Colors.white60,
                                                  border: _borderEn),
                                              child: Center(
                                                  child: Text(
                                                "English",
                                                style: TextStyle(
                                                    fontFamily: "NexaXBold",
                                                    fontSize: 20,
                                                    color: Colors
                                                        .deepOrangeAccent),
                                              )),
                                            ),
                                            onTap: () {
                                              setState(() {
                                                changeLocale("en");
                                                changeBorder();
                                              });
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              });
                            });
                      },
                      child: Container(
                        width: size.width * 0.97,
                        height: size.height*0.1,
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
                                LocaleKeys.language_text.tr(),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                  Container(
                    width: size.width * 0.97,
                    height: size.height*0.1,
                    color: Colors.white12,
                    child: TextButton(
                      style: ButtonStyle(
                          overlayColor: MaterialStateProperty.all(
                              Colors.deepOrangeAccent.withOpacity(0.5))),
                      onPressed: () {
                        AuthService().logOut();
                      },
                      child: Container(
                        width: 390,
                        height: size.height*0.1,
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
                                LocaleKeys.log_out_text.tr(),
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * 0.97,
                      height: size.height*0.1,
                      color: Colors.white12,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * 0.97,
                      height: size.height*0.1,
                      color: Colors.white12,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: size.width * 0.97,
                      height: size.height*0.1,
                      color: Colors.white12,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ), color: Colors.white12,),
                      width: size.width * 0.97,
                      height: size.height*0.1,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
