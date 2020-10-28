import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:qubeez/model/auth/user.dart';
import 'package:qubeez/preference/preference_keys.dart';
import 'package:qubeez/preference/qbeez_prefs.dart';
import 'package:qubeez/ui/dashboard.dart';
import 'package:qubeez/ui/welcome.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/ui.dart';

class SplashLaunch extends StatelessWidget {

  getUserFromPreference(BuildContext context) {
    QbeezPrefs.getLoggedUser(userKeys).then((value){
      User _user = User.fromJson(value);
      print("userData -> ${_user.access_token}");
      if(_user != null){
        AppUtils.currentUser = _user;
        Timer(Duration(seconds: 2), () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Dashboard())));
      }else{
        Timer(Duration(seconds: 2), () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => WelcomeQubeez())));
      }
    }).catchError((error){ print("Error -> $error");
    Timer(Duration(seconds: 2), () =>
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => WelcomeQubeez())));});
  }

  @override
  Widget build(BuildContext context) {

    getUserFromPreference(context);
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