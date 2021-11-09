import 'package:flutter/material.dart';
import 'package:individual_project/pages/start.dart';

void main() => runApp(WakeMeApp());

class WakeMeApp extends StatelessWidget{

@override 
Widget build(BuildContext context){
  return MaterialApp(
    title: 'WakeMeUp',
    theme: ThemeData(
      primaryColor: Colors.grey,
    ),
    home: Start()
  );
}
}

  