import 'package:flutter/material.dart';
import 'package:qubeez/utils/ui.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(WELCOME_BACKGROUND_PATH), fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
          Icon(Icons.arrow_back,
          color: Colors.white,),
        SizedBox(height: 16,),
        Text("Sign in",
          textAlign: TextAlign.left,
          style: TextStyle(fontSize: 18.0,
              color: Colors.white,
          fontWeight: FontWeight.w700)),
            SizedBox(height: 50,),

            Text(
              "Welcome Back",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Colors.white
              ),
            ),
            Text(
              "Hello there, sign in to continue!",
              textAlign: TextAlign.left,
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.white
              ),),
            SizedBox(height: 25,),
          ],
        ),
      ),
    );
  }
}
