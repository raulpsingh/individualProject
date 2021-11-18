import 'package:flutter/material.dart';


class StatisticsPage extends StatelessWidget {
  const StatisticsPage({Key? key}) : super(key: key);

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
        ),
      ),
    );
  }
}
