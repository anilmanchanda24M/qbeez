import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qubeez/ui/welcome.dart';
import 'package:qubeez/utils/ui.dart';

class SplashLaunch extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    Timer(Duration(seconds: 4), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WelcomeQubeez())));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(WELCOME_BACKGROUND_PATH), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(splashQbeezLogo, fit: BoxFit.fill),
                SizedBox(height: 12,),
                Image.asset(splashQbeezLogoText, fit: BoxFit.fill)
              ],
            ),
          ),
        ),
      ),
    );
  }
}