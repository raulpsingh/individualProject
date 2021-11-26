import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:individual_project/pages/alarmPage.dart';
import 'package:individual_project/pages/settingsPage.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:individual_project/pages/statisticPage.dart';
import 'package:individual_project/translations/locale_keys.g.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  final tabs = [AlarmsList(), StatisticsPage(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    SnakeShape snakeShape = SnakeShape.circle;
    bool showSelectedLabels = false;
    bool showUnselectedLabels = true;
    Gradient selectedGradient =
        const LinearGradient(colors: [Colors.red, Colors.amber]);
    Gradient unselectedGradient =
        const LinearGradient(colors: [Colors.red, Colors.blueGrey]);
    Gradient backGround =
        const LinearGradient(colors: [Colors.white, Colors.white]);

    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: tabs[_currentIndex],
        bottomNavigationBar: SnakeNavigationBar.gradient(
          backgroundGradient: backGround,
          behaviour: SnakeBarBehaviour.floating,
          snakeShape: snakeShape,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          padding: const EdgeInsets.all(12),
          snakeViewGradient: selectedGradient,
          selectedItemGradient:
              snakeShape == SnakeShape.indicator ? selectedGradient : null,
          unselectedItemGradient: unselectedGradient,
          showUnselectedLabels: showUnselectedLabels,
          showSelectedLabels: showSelectedLabels,
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: LocaleKeys.alarms_text.tr() ),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: LocaleKeys.statistics_text.tr()),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: LocaleKeys.setting_text.tr()),
          ],
        ),
      ),
    );
  }
}
