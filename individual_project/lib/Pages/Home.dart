import 'package:flutter/material.dart';
import 'package:individual_project/main.dart';

class HomePage extends StatelessWidget {
    const HomePage({ Key? key }) : super(key: key);
  
    @override
    Widget build(BuildContext context) {
      return Container(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(title: Text('WakeMeUp'), leading: Icon(Icons.alarm),),
          body: Text('body'),
        ),
      );
    }
  }
