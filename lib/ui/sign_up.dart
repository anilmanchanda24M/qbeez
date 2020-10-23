import 'package:flutter/material.dart';
import 'package:qubeez/ui/otp.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

class SignupScreen extends StatefulWidget{

  BuildContext prevContext;

  SignupScreen(this.prevContext);

  @override
  _SignupScreen createState() => _SignupScreen();
}

class _SignupScreen extends State<SignupScreen>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(extendBody: true,
          body:


          Stack(
            children: [
              Container(
                child: Image.asset(
                  WELCOME_BACKGROUND_PATH, width: double.infinity, height: double.infinity,fit: BoxFit.fill,
                ),
              ),
              SingleChildScrollView(
                  child:Column(

                      children:[

                        Container(
                          //color:Colors.blue,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN_EXTRA,RIGHT_MARGIN, BOTTOM_MARGIN),
                          padding: EdgeInsets.all(PADDING_ALL_12),
                          child:Column(

                            children: [
                              Icon(
                                Icons.arrow_back,
                                color: Colors.white,

                              ),
                              Padding(
                                padding: EdgeInsets.all(PADDING_ALL_16),
                              ),
                              Text(
                                "Sign up", textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: FONT_SIGNIN,color: Colors.white
                                ),

                              )
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.fromLTRB(PADDING_ALL_12,PADDING_ALL_12,PADDING_ALL_12,NO_PADDING),
                          child: Text(
                            "Welcome Back",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: FONT_SIZE_WELCOME,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          //color: Colors.blue,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.only(left: PADDING_ALL_12),
                          child: Text(
                            "Hello there, sign up to continue!",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: FONT_SIZE_MEDIUM-2,
                                color: Colors.white
                            ),
                          ),
                        ),
                        Container(
                          //color: Colors.blue,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.only(left: PADDING_ALL_12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Name",textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(PADDING_ALL_8)
                              ),
                              TextField(

                                decoration: InputDecoration(
                                    prefixIcon:
                                    Icon(
                                      Icons.person_outline,
                                      color: Colors.purple,

                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(

                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)

                                        )
                                    )
                                ),
                                style: TextStyle(
                                  color: Colors.purple,
                                  fontSize: 18.0,


                                ),

                              ),

                            ],
                          ),
                        ),
                        Container(
                          //color: Colors.blue,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.only(left: PADDING_ALL_12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Phone No",textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(PADDING_ALL_8)
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    prefixIcon:
                                    Icon(
                                      Icons.phone_iphone,
                                      color: Colors.purple,

                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(

                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)

                                        )
                                    )
                                ),
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),

                              ),

                            ],
                          ),
                        ),
                        Container(
                          //color: Colors.blue,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.only(left: PADDING_ALL_12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Email ID",textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(PADDING_ALL_8)
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    prefixIcon:
                                    Icon(
                                      Icons.mail_outline,
                                      color: Colors.purple,

                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(

                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)

                                        )
                                    )
                                ),
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),

                              ),

                            ],
                          ),
                        ),
                        Container(
                          //color: Colors.blue,
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.only(left: PADDING_ALL_12),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(
                                "Password",textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                              Padding(
                                  padding: EdgeInsets.all(PADDING_ALL_8)
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    prefixIcon:
                                    Icon(
                                      Icons.lock_open,
                                      color: Colors.purple,

                                    ),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(

                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30.0)

                                        )
                                    )
                                ),
                                style: TextStyle(
                                    color: Colors.purple,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold
                                ),

                              ),

                            ],
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN,TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.all(PADDING_ALL_12),
                          child:RaisedButton(

                              elevation: 8.0,
                              onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen())),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22.0)
                              ),
                              padding: EdgeInsets.fromLTRB(PADDING_ALL_16*2.0,PADDING_ALL_12, PADDING_ALL_16*2.0,PADDING_ALL_12),

                              child : Text(
                                "Sign up",
                                style: TextStyle(
                                    color: Colors.purpleAccent,
                                    fontSize: FONT_SIZE_MEDIUM
                                ),textAlign: TextAlign.center,

                              )

                          ),
                        ),
                        Container(
                            alignment: Alignment.center,

                            child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [

                                  Text(
                                    "Already have an account?",textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white, fontSize: FONT_SIZE_MEDIUM-2),
                                  ),
                                  FlatButton(
                                    textColor: Colors.white,
                                    onPressed: () {

                                    },
                                    child: Text("Sign in",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: FONT_SIZE_MEDIUM-2
                                      ),),

                                  )
                                ])
                        ),
                      ]
                  )
              )
            ],

          ),
        )


    );
  }
}