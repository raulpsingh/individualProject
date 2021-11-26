import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import 'functions/functions.dart';

final Shader linearGradient = LinearGradient(
  colors: <Color>[Colors.red, Colors.orange],
).createShader(
  Rect.fromLTWH(0.0, 0.0, 200.0, 70.0),
);

Widget input(RadiantGradientMask mask, String hint,
    TextEditingController controller, bool obscure) {
  return Container(
    padding: EdgeInsets.only(left: 20, right: 20),
    child: TextField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(fontSize: 20, color: Colors.white),
      decoration: InputDecoration(
          hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white30,
              fontFamily: 'Nexa'),
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
          fontSize: 25,
          fontFamily: 'Nexa',
          foreground: Paint()..shader = linearGradient),
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
                foreground: Paint()..shader = linearGradient,
                fontFamily: 'Nexa')),
      ),
    ),
  );
}

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}


class _DropDownState extends State<DropDown> {

  String dropdownValue = 'English';

  @override
  Widget build(BuildContext context) {
    print(context.locale.toString());
    if(context.locale.toString()=='ru'){
      dropdownValue="Russian";
    }if(context.locale.toString()=="en"){
      dropdownValue=="English";
    }
    return DropdownButton<String>(
      dropdownColor: Colors.white60,
      value: dropdownValue,
      icon: const Icon(
      Icons.language,
        color: Colors.deepOrangeAccent,
      ),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepOrangeAccent,fontSize: 20,fontFamily: "NexaXBold"),
      underline: Container(
        height: 2,
        color: Colors.deepOrangeAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
          if(dropdownValue=="Russian"){
            context.setLocale(Locale('ru'),);
          }else if(dropdownValue=="English"){
            context.setLocale(Locale('en'),);
          }
        });
      },
      items: <String>['English', 'Russian',]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({Key? key}) : super(key: key);

  @override
  _LanguageDialogState createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  int? val = -1;
  @override
     Widget build (BuildContext context)  {
    print("A");
    return AlertDialog(
      title: Text("Select language"),
         actions : [
           ListTile(
            title: Text("Male"),
            leading: Radio(
              value: 1,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value as int?;
                });
              },
              activeColor: Colors.green,
            ),
          ),
          ListTile(
            title: Text("Female"),
            leading: Radio(
              value: 2,
              groupValue: val,
              onChanged: (value) {
                setState(() {
                  val = value as int?;
                });
              },
              activeColor: Colors.green,
            ),
          ),
      ],
    );
  }
}


