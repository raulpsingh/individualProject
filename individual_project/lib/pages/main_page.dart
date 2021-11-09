import 'package:flutter/material.dart';
import 'package:individual_project/pages/home.dart';

class mainPage extends StatefulWidget {
  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<mainPage> {
  int _currentidex = 0;
  final tabs = [
    HomePage(),
    HomePage(),
    HomePage()
  ];
  @override
  Widget build(BuildContext context) {
    String appTitle = 'WakeMeUp';
    return MaterialApp(
        home: Scaffold(
          body: tabs[_currentidex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentidex,
            type: BottomNavigationBarType.shifting,
            selectedItemColor: Colors.deepOrange,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm),
                title: Text('Alarms',style: TextStyle(fontFamily: "Nexa")),
                backgroundColor: Colors.orange,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics),
                title: Text('Statistics',style: TextStyle(fontFamily: "Nexa")),
                backgroundColor: Colors.orangeAccent,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings',style: TextStyle(fontFamily: "Nexa")),
                backgroundColor: Colors.orange,
              ),
            ],
            onTap: (index) {
              setState(() {
                _currentidex = index;
              });
            },
          ),
          resizeToAvoidBottomInset: false,
        ));
  }
}
