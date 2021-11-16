import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:individual_project/databases/database_service.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/functions/notification_service.dart';
import 'package:individual_project/pages/alarmRingPage.dart';
import 'package:individual_project/pages/start.dart';
import 'package:provider/provider.dart';

import 'objects/user.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
      title: 'WakeMeUp',
      theme: ThemeData(
        primaryColor: Colors.grey,
      ),
      home:WakeMeApp()));
  await AndroidAlarmManager.initialize();
}


class WakeMeApp extends StatefulWidget {
  const WakeMeApp({Key? key}) : super(key: key);

  @override
  _WakeMeAppState createState() => _WakeMeAppState();
}

class _WakeMeAppState extends State<WakeMeApp> {
  @override
  void initState(){
    super.initState();
    NotificationService.init();
    listenNotifications();

  }
  void listenNotifications() =>
      NotificationService.onNotifications.stream.listen(onClickedNotification);

  void onClickedNotification(String? payload) =>
      Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => RingPage()),
      );
  @override
  Widget build(BuildContext context) {
      return StreamProvider<AppUser?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
          title: 'WakeMeUp',
          theme: ThemeData(
            primaryColor: Colors.grey,
          ),
          home: Start()),
    );
  }
}



