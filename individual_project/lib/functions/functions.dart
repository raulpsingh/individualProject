import 'package:flutter/cupertino.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String dateFormat(DateTime time){
  String _time = DateFormat.jm().format(time);
  return _time;
}

class AppUser{

  late String id ;

  AppUser.fromFirebase(User user){
    id = user.uid;

  }

}

class RadiantGradientMask extends StatelessWidget {
  RadiantGradientMask({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => RadialGradient(
        center: Alignment.centerLeft,
        radius: 0.8,
        colors: [Colors.red, Colors.orange],
        tileMode: TileMode.mirror,
      ).createShader(bounds),
      child: child,
    );
  }
}