import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qubeez/preference/qbeez_prefs.dart';
import 'package:qubeez/ui/auth/login_page.dart';
import 'package:qubeez/ui/auth/register_page.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

class WelcomeQubeez extends StatefulWidget {
  @override
  _WelcomeQubeezState createState() => _WelcomeQubeezState();
}

class _WelcomeQubeezState extends State<WelcomeQubeez> {

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  @override
  void initState() {
    super.initState();
    firebaseCloudMessagingListeners();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        width: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(WELCOME_BACKGROUND_PATH), fit: BoxFit.cover)),
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(splashQbeezLogo, width: 150, height: 180, fit: BoxFit.fill),
                      ],
                    )),

                Expanded(child:  Column(
                  // mainAxisSize: MainAxisSize.min,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(LEFT_MARGIN, NO_MARGIN, NO_MARGIN, NO_MARGIN),
                      child: Text(
                        "Welcome", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: FONT_SIZE_WELCOME
                      ),
                      ),),
                    Padding(padding: EdgeInsets.fromLTRB(LEFT_MARGIN, 14.0, NO_MARGIN, NO_MARGIN),
                      child: Text(
                        "Manage your expenses", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: FONT_SIZE_MEDIUM
                      ),
                      ),),
                    Padding(padding: EdgeInsets.fromLTRB(LEFT_MARGIN, 6.0, NO_MARGIN, NO_MARGIN),
                      child: Text(
                        "Seamless & Intuitive", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: FONT_SIZE_MEDIUM
                      ),
                      ),),

                    Padding(padding: EdgeInsets.fromLTRB(LEFT_MARGIN, 50.0, LEFT_MARGIN, 6.0),
                      child: RaisedButton(
                        elevation: 6.0,
                        onPressed: ()=> Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RegisterPage())),
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22.0)
                        ),
                        padding: EdgeInsets.all(PADDING_ALL_12),
                        child :Stack(
                          children:[
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(ICON_SIGNUP),
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sign up",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Color(HOME_APP_BAR_COLOR),
                                      fontSize: FONT_SIZE_MEDIUM
                                  ),
                                )
                            )
                          ],
                        ),
                      ),),
                    Container(
                      margin: EdgeInsets.only(top: 14),
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                              style: TextStyle(fontSize: 14, color: Colors.white),
                              text: "Already have an account? ",
                              children: [
                                TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => LoginPage()));
                                      },
                                    text: "Sign in",
                                    style: TextStyle(color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold))
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),flex: 1,)
              ],
            ),
          ),
        ),
      ),
    );
  }

  void firebaseCloudMessagingListeners() {
    if (Platform.isIOS) iOS_Permission();

    _firebaseMessaging.getToken().then((token){
      print(token);
      QbeezPrefs.saveFBToken(token);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
      },
      // onBackgroundMessage: messageHandle,
      onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
      },
    );
  }

  void iOS_Permission() {
    _firebaseMessaging.requestNotificationPermissions(
        IosNotificationSettings(sound: true, badge: true, alert: true)
    );
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings)
    {
      print("Settings registered: $settings");
    });
  }
}