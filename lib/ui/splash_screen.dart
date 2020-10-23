import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qubeez/ui/welcome.dart';
import 'package:qubeez/utils/ui.dart';
class SplashScreen extends StatefulWidget{
  @override
  _SplashScreen createState() => _SplashScreen();
}
class _SplashScreen extends State<SplashScreen>{

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    void navigationPage(){
      Navigator.of(context).pushReplacementNamed('/WelcomeQubeez');
    }
    startTime() async{
      var _duration =   new Duration(seconds: 2);
      return new Timer(_duration, navigationPage);
    }


    @override
    void initState() {
      super.initState();
      startTime();
    }
    return MaterialApp(
        home: Scaffold(
        body: Container(
          //height: size.height,
         // width: double.infinity,
        child:Stack(
          alignment: Alignment.center ,
          children: [
            Image.asset(WELCOME_BACKGROUND_PATH, width: double.infinity,fit: BoxFit.fill,),
            Positioned(

              child: Image.asset(
                QUBEEZ_LOGO, alignment: Alignment.center,
              ),
            )
          ],
        ),
        ),

        ),

      );
  }
}