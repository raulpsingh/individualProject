import 'package:flutter/material.dart';
import 'package:individual_project/databases/database_service.dart';
import 'package:individual_project/functions/AlarmRing.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.4), BlendMode.dstATop),
                image: AssetImage('assets/mountain.png')),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(100),
                child: Row(
                  children: [
                    RaisedButton(
                      child: Text("Sign out"),
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                        AuthService().logOut();
                      },
                    ),
                    RaisedButton(
                      child: Text("Sign out"),
                      color: Colors.deepOrangeAccent,
                      onPressed: () {
                      },
                    ),],
                ),

              ),
            ],
          ),
        ),
      ),
    );
  }
}
