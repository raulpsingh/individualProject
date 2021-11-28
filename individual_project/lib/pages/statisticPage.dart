import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/objects/historyObject.dart';
import 'package:individual_project/objects/user.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'package:provider/provider.dart';

List histories = <History>[];

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({Key? key}) : super(key: key);

  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  late StreamSubscription<List<History>> historyStreamSubscription;

  @override
  void dispose() {
    if (historyStreamSubscription != null) {
      print('unsubscribing');
      historyStreamSubscription.cancel();
    }
    super.dispose();
  }

  Future<void> loadData(AppUser user) async {
    var stream = getHistories(user);
    historyStreamSubscription = stream.listen((List<History> data) {
      histories = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppUser user = Provider.of<AppUser>(context);
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;
    loadData(user);
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
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: paddHeight * 0.08,
                      bottom: paddHeight * 0.03,
                      left: paddWidth * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        LocaleKeys.statistics_text.tr(),
                        style: TextStyle(fontFamily: "NexaXBold", fontSize: 20),
                      ),
                      PopupMenuButton(
                          icon: Icon(
                            Icons.more_vert,
                            size: 30,
                          ),
                          itemBuilder: (context) => [
                                PopupMenuItem(
                                  child: Text(
                                      LocaleKeys.remove_statistics_text.tr()),
                                  value: 1,
                                  onTap: () {
                                    removeAllHistory();
                                  },
                                ),
                              ])
                    ],
                  ),
                ),
                Expanded(
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection("history")
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<dynamic> snapshot) {
                          return ListView.builder(
                              itemCount: histories.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding:
                                      EdgeInsets.only(top: paddHeight * 0.02),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Container(
                                        width: size.width * 0.97,
                                        height: size.height * 0.245,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.white38),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: paddHeight * 0.02),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: paddWidth * 0.03,
                                                        right:
                                                            paddWidth * 0.03),
                                                    child: Text(
                                                      monthFormat(
                                                              histories[index]
                                                                  .time,
                                                              context.locale
                                                                  .toString())
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: "Nexa",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text(
                                                    dateFormat(
                                                            histories[index]
                                                                .time,
                                                            context.locale
                                                                .toString())
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Nexa",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: paddHeight * 0.02),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: paddWidth * 0.03),
                                                    child: Text(
                                                      LocaleKeys
                                                          .mission_stat_text
                                                          .tr(),
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontFamily: "Nexa",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                  Text(
                                                    missionDefiner(
                                                            histories[index]
                                                                .mission)
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontFamily: "Nexa",
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: paddHeight * 0.02),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        left: paddWidth * 0.03),
                                                    child: Text(
                                                      LocaleKeys.time_took_text
                                                          .tr(),
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontFamily: "Nexa",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: paddHeight * 0.02,left: paddWidth * 0.03),
                                              child: Row(
                                                children: [
                                                  Text(
                                                  timeSpent(histories[index]
                                                      .timer)
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontFamily: "NexaXBold",
                                                      fontWeight:
                                                      FontWeight.bold),
                                                )],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              });
                        }),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
