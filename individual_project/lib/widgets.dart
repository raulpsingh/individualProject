import 'package:flutter/material.dart';

import 'functions/functions.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.red, Colors.orange],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);

Widget input(
    RadiantGradientMask mask, String hint, TextEditingController controller, bool obscure) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white30,fontFamily: 'Nexa'),
          hintText: hint,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.deepOrangeAccent, width: 3)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.white54, width: 1)),
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: IconTheme(
              data: IconThemeData(color: Colors.white),
              child: mask,
            ),
          )),
    ),
  );
}

Widget loginButton(

  String text,
  void func(),
) {
  return RaisedButton(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    splashColor: Colors.deepOrangeAccent,
    highlightColor: Colors.deepOrangeAccent,
    color: Colors.white70,
    child: Text(
      text,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,fontFamily: 'Nexa',
          foreground: Paint()..shader=linearGradient
          ),
    ),
    onPressed: () {
      func();
    },
  );
}

Widget logo() {
  return Padding(
    padding: EdgeInsets.only(top: 100),
    child: Container(
      child: Align(
        child: Text('WakeMeUp',
            style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.bold,
                foreground: Paint()..shader=linearGradient,
                fontFamily: 'Nexa')),
      ),
    ),
  );
}
