import 'package:firebase_core/firebase_core.dart';
import 'package:individual_project/services/database_service.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/services/notification_service.dart';
import 'package:individual_project/pages/alarmRingPage.dart';
import 'package:individual_project/pages/start.dart';
import 'package:individual_project/translations/codegen_loader.g.dart';
import 'package:provider/provider.dart';
import 'objects/user.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    home: EasyLocalization(
      path: 'assets/translations',
      supportedLocales: [
        Locale('en'),
        Locale('ru')
      ],
      fallbackLocale: Locale('en'),
      assetLoader: CodegenLoader(),
      child: WakeMeApp(),
    ),
  ));
  NotificationService.init();
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
    listenNotification();
  }
  void listenNotification() {
    NotificationService.onNotifications.stream.listen(onClickedNotification);
}
  void onClickedNotification(String? payload) async {
    print("ssssssssssss");
    print(payload);
    Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => RingPage(payload: payload)),
    );
  }
  void dispose(){
    super.dispose();
    NotificationService.onNotifications.close();
  }

  @override
  Widget build(BuildContext context) {
      return StreamProvider<AppUser?>.value(
      value: AuthService().currentUser,
      initialData: null,
      child: MaterialApp(
        supportedLocales: context.supportedLocales,
          localizationsDelegates: context.localizationDelegates,
          locale: context.locale,
          title: 'WakeMeUp',
          theme: ThemeData(
            primaryColor: Colors.grey,
          ),
          home: Start()),
    );
  }
}



