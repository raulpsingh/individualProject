import 'package:flutter/material.dart';
import 'package:individual_project/widgets.dart';
import 'package:individual_project/functions/functions.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

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
              child: input(Icon(Icons.email, color: Colors.deepOrangeAccent),
                  "Email", _emailController, false)),
          Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: input(
                  Icon(Icons.password_rounded, color: Colors.deepOrangeAccent),
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

    void _buttonAction() {
      _email = _emailController.text;
      _password = _passwordController.text;

      _emailController.clear();
      _passwordController.clear();
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
                (showLogin?
                Column(
                  children: <Widget> [_form('Login', _buttonAction),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: GestureDetector(
                      child: Text("Register",style: TextStyle(fontSize: 20,fontFamily: 'Nexa',fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),
                      onTap: (){
                        setState(() {
                          showLogin = false;
                        });

                      },

                    ),
                  )

                  ],
                )
                : Column(
                  children: <Widget> [_form('Register', _buttonAction),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: GestureDetector(
                        child: Text("Already registered? Login",style: TextStyle(fontSize: 20,fontFamily: 'Nexa',fontWeight: FontWeight.bold, color: Colors.deepOrangeAccent),),
                        onTap: (){
                          setState(() {
                            showLogin = true;
                          });

                        },

                      ),
                    )

                  ],
                )
                ),
              ],
            ),
          )),
    );
  }
}
