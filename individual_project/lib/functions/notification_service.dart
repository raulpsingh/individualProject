import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:rxdart/rxdart.dart';

import '../main.dart';
class NotificationService {
static final onNotifications= BehaviorSubject<String?>();



  static Future init () async{
    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@drawable/ic_launcher_adaptive_fore');
    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async{
        onNotifications.add(payload);

        });
  }

  static Future showNotification(Alarm a) async {
    DateTime _time = a.time.toDate();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
        "main_channel 2",
        "Main_channel 3",
        importance: Importance.max,
        priority: Priority.max,
        icon: '@drawable/ic_launcher_adaptive_fore',
        sound: RawResourceAndroidNotificationSound('a_long_cold_sting'));
    const NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.schedule(
      0, "Alarm Ringing", "Ringing",
      _time,
      NotificationDetails(
        android: androidPlatformChannelSpecifics,
      ),
    );
  }
}