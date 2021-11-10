import 'package:flutter/material.dart';
import 'package:individual_project/pages/alarmPage.dart';
import 'package:individual_project/pages/settings.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int _currentIndex = 0;
  final tabs = [AlarmPage(), AlarmPage(), SettingsPage()];
  @override
  Widget build(BuildContext context) {
    String appTitle = 'WakeMeUp';
    Color selectedColor = Colors.deepOrangeAccent;
    SnakeShape snakeShape = SnakeShape.circle;
    bool showSelectedLabels = false;
    bool showUnselectedLabels = true;
    Gradient selectedGradient =
        const LinearGradient(colors: [Colors.red, Colors.amber]);
    Color unselectedColor = Colors.blueGrey;
    Gradient unselectedGradient =
        const LinearGradient(colors: [Colors.red, Colors.blueGrey]);

    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: tabs[_currentIndex],
        bottomNavigationBar: SnakeNavigationBar.gradient(
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
            BottomNavigationBarItem(icon: Icon(Icons.alarm), label: 'Alarms'),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: 'Statistics'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
