
import 'package:flutter/material.dart';


class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
    width: double.infinity,
    height: double.infinity,
decoration: BoxDecoration(
image: DecorationImage(
  fit: BoxFit.fitHeight,
    colorFilter: ColorFilter.mode(Colors.white.withOpacity(0.2), BlendMode.dstATop),
image: AssetImage('assets/astronomy.jpg')
),

),
      child: Column(

        children: <Widget>[




        ],
      )
    );
  }
}
