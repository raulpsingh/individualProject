import 'package:flutter/material.dart';
import 'package:individual_project/pages/mainPage.dart';

class RingPage extends StatelessWidget {

  const RingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 230),
                  child: Container(
                    child: Text('Wake Up',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 50,fontFamily: "NexaXBold",color: Colors.deepOrangeAccent)),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 100),
                child: Container(
                  width: 200,
                  height: 70 ,
                  color: Colors.deepOrangeAccent,
                  child: TextButton(onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(builder: (context) => MainPage()),
                    );
                  },
                  child: Text("Stop alarm",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: "NexaXBold",color: Colors.white),),
                  ),
                ),
              ),


            ],
          ),
    ),
    );
  }
}
