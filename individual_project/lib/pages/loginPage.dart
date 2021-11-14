import 'package:flutter/material.dart';
import 'package:individual_project/databases/database_service.dart';
import 'package:individual_project/objects/user.dart';
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
    Widget _form(String label, void func()) {
      return Container(
          child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(bottom: 20, top: 80),
              child: input(RadiantGradientMask(child: Icon(Icons.email)),
                  "Email", _emailController, false)),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: input(
                  RadiantGradientMask(child: Icon(Icons.password_rounded)),
                  "Password",
                  _passwordController,
                  true)),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Container(
              height: 50,
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
          'Sign in failed. Please check your email and password.',
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
          'Registration failed. Please check your email and password.',
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
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                logo(),
                (showLogin
                    ? Column(
                        children: <Widget>[
                          _form('Login', _loginButton),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              child: Text(
                                "Register",
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
                          _form('Register', _registerButton),
                          Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: GestureDetector(
                              child: Text(
                                "Already registered? Login",
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
              ],
            ),
          )),
    );
  }
}
