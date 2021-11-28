import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/objects/alarmObject.dart';
import 'package:rxdart/rxdart.dart';

class NotificationService {
  static final onNotifications = BehaviorSubject<String?>();
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@drawable/ic_launcher_adaptive_fore');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });
  }

  static Future showNotification(Alarm a) async {
    DateTime _time = a.time.toDate();
    String _stringTime = formatDate(_time);
    int id = 0;
    id = a.id!;
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails("main_channel 2", "Main_channel 3",
            importance: Importance.max,
            priority: Priority.max,
            icon: '@drawable/ic_launcher_adaptive_fore',
            sound: RawResourceAndroidNotificationSound('a_long_cold_sting'));
    await flutterLocalNotificationsPlugin.schedule(
        id,
        "Alarm Ringing",
        _stringTime,
        _time,
        NotificationDetails(
          android: androidPlatformChannelSpecifics,
        ),
        payload: id.toString());
  }

  static Future removeNotification(Alarm a) async {
    int id = a.id!;
    flutterLocalNotificationsPlugin.cancel(id);
    List pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    for (var pendingNotificationRequest in pendingNotificationRequests) {
      print(
          'pending notification: [id: ${pendingNotificationRequest.id}, title: ${pendingNotificationRequest.title}, body: ${pendingNotificationRequest.body}, payload: ${pendingNotificationRequest.payload}]');
    }
  }

  static Future<void> findNotification() async {
    List pendingNotificationRequests =
        await flutterLocalNotificationsPlugin.pendingNotificationRequests();
    for (var pendingNotificationRequest in pendingNotificationRequests) {
      print(
          'pending notification: [id: ${pendingNotificationRequest.id}, title: ${pendingNotificationRequest.title}, body: ${pendingNotificationRequest.body}, payload: ${pendingNotificationRequest.payload}]');
    }
  }
}
