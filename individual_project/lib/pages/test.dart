import 'package:flutter/material.dart';

bool isSwitched = false;

class test extends StatelessWidget {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.fitHeight,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/astronomy.jpg')),
      ),
      child: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              Switch(
                value: isSwitched,
                onChanged: (value) {},
                activeTrackColor: Colors.lightGreenAccent,
                activeColor: Colors.green,
              ),
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
