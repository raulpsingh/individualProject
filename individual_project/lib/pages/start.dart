import 'package:flutter/material.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:individual_project/pages/alarmPage.dart';
import 'package:individual_project/pages/login.dart';
import 'package:individual_project/pages/main_page.dart';
import 'package:provider/provider.dart';

class Start extends StatelessWidget {
  const Start ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppUser? user = Provider.of<AppUser?>(context);
    final bool isLoggedIn= user!= null;
    return isLoggedIn? mainPage(): LoginPage();
  }
}