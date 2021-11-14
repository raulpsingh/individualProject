import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:individual_project/databases/database_service.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/pages/start.dart';
import 'package:provider/provider.dart';

import 'objects/user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(WakeMeApp());
  await AndroidAlarmManager.initialize();
}

class WakeMeApp extends StatelessWidget {
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
