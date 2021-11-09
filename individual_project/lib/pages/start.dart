import 'package:flutter/material.dart';
import 'package:individual_project/pages/home.dart';
import 'package:individual_project/pages/login.dart';
import 'package:individual_project/pages/main_page.dart';

class Start extends StatelessWidget {
  const Start ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isLoggedIn= false;
    return isLoggedIn? HomePage(): mainPage();
  }
}
