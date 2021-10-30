import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
 LoginPage({Key? key}) : super(key: key);

  @override
   _LoginPageState createState() => _LoginPageState();
}

class  _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {

    Widget _logo(){
      return Padding(
        padding: EdgeInsets.only(top: 100),
        child: Container(
          child: Align(
           child: Text('WakeMeUp', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white)), ),
        ),

      );

    }
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: <Widget>[
          _logo(),
          //_form(),


        ],

      )

    );
  }
}
