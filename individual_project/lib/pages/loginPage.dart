import "package:easy_localization/easy_localization.dart";
import 'package:flutter/material.dart';
import 'package:individual_project/services/database_service.dart';
import 'package:individual_project/objects/user.dart';
import 'package:individual_project/translations/locale_keys.g.dart';
import 'package:individual_project/widgets.dart';
import 'package:individual_project/functions/functions.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  AuthService _authService = AuthService();
  late String _email;
  late String _password;
  bool showLogin = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double paddHeight = MediaQuery.of(context).size.height;
    final double paddWidth = MediaQuery.of(context).size.width;
    Widget _form(String label, void func()) {
      return Container(
          child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(
                  bottom: paddHeight * 0.03, top: paddHeight * 0.07),
              child: input(RadiantGradientMask(child: Icon(Icons.email)),
                  LocaleKeys.email_text.tr(), _emailController, false)),
          Padding(
              padding: EdgeInsets.only(bottom: paddHeight * 0.02),
              child: input(
                  RadiantGradientMask(child: Icon(Icons.password_rounded)),
                  LocaleKeys.password_text.tr(),
                  _passwordController,
                  true)),
          Padding(
            padding: EdgeInsets.only(
                left: paddWidth * 0.05, right: paddWidth * 0.05),
            child: Container(
              height: size.height * 0.08,
              width: MediaQuery.of(context).size.width,
              child: loginButton(label, func),
            ),
          )
        ],
      ));
    }

    void _loginButton() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      AppUser? user = await _authService.signInWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        showToast(
          LocaleKeys.sign_in_failed_text.tr(),
          textStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.white12,
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: Duration(seconds: 1),
          duration: Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    void _registerButton() async {
      _email = _emailController.text;
      _password = _passwordController.text;

      if (_email.isEmpty || _password.isEmpty) return;

      AppUser? user = await _authService.registerWithEmailAndPassword(
          _email.trim(), _password.trim());
      if (user == null) {
        showToast(
          LocaleKeys.registration_failed_text.tr(),
          textStyle: TextStyle(color: Colors.white),
          backgroundColor: Colors.white12,
          context: context,
          animation: StyledToastAnimation.scale,
          reverseAnimation: StyledToastAnimation.fade,
          position: StyledToastPosition.center,
          animDuration: Duration(seconds: 1),
          duration: Duration(seconds: 4),
          curve: Curves.elasticOut,
          reverseCurve: Curves.linear,
        );
      } else {
        _emailController.clear();
        _passwordController.clear();
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blueGrey,
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                colorFilter: ColorFilter.mode(
                    Colors.white.withOpacity(0.6), BlendMode.dstATop),
                image: AssetImage('assets/mountains.png')),
          ),
          child: Padding(
            padding: EdgeInsets.only(top: paddHeight * 0.03),
            child: Column(
              children: <Widget>[
                logo(),
                (showLogin
                    ? Column(
                        children: <Widget>[
                          _form(LocaleKeys.login_text.tr(), _loginButton),
                          Padding(
                            padding: EdgeInsets.only(top: paddHeight * 0.03),
                            child: GestureDetector(
                              child: Text(
                                LocaleKeys.register_text.tr(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = linearGradient),
                              ),
                              onTap: () {
                                setState(() {
                                  showLogin = false;
                                });
                              },
                            ),
                          )
                        ],
                      )
                    : Column(
                        children: <Widget>[
                          _form(LocaleKeys.register_text.tr(), _registerButton),
                          Padding(
                            padding: EdgeInsets.only(top: paddHeight * 0.03),
                            child: GestureDetector(
                              child: Text(
                                LocaleKeys.already_registered_text.tr(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Nexa',
                                    fontWeight: FontWeight.bold,
                                    foreground: Paint()
                                      ..shader = linearGradient),
                              ),
                              onTap: () {
                                setState(() {
                                  showLogin = true;
                                });
                              },
                            ),
                          )
                        ],
                      )),

                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      Padding(
                        padding: EdgeInsets.only(right: paddWidth*0.02),
                        child: Container(
                            width: size.width*0.4,
                            height:  size.height*0.07,
                            child: DropDown()),
                      )
                    ],),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
