import 'package:flutter/material.dart';
import 'package:individual_project/Pages/Login.dart';
import 'Pages/Home.dart';
import 'Pages/Login.dart';
void main() => runApp(WakeMeApp());

class WakeMeApp extends StatelessWidget{

@override 
Widget build(BuildContext context){
  return MaterialApp(
    title: 'WakeMeUp',
    theme: ThemeData(
      primaryColor: Color.fromRGBO(50, 65, 85, 1),
    ),
    home: LoginPage()
  );
}
}

  