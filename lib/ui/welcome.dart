import 'package:flutter/material.dart';
import 'package:qubeez/ui/sign_in.dart';
import 'package:qubeez/ui/sign_up.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

class WelcomeQubeez extends StatefulWidget{
  @override
  _WelcomeQubeez createState() => _WelcomeQubeez();
}
class _WelcomeQubeez extends State<WelcomeQubeez>{

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
            home: Scaffold(
              body:
                 Stack(
                  children: [
                    Container(
                      child: Image.asset(WELCOME_BACKGROUND_PATH,height: double.infinity,width: double.infinity,fit: BoxFit.fill),
                    ),
                    Column(

                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN,LOGO_TOP_MARGIN,RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.all(PADDING_ALL_16),
                          child: Image.asset(QUBEEZ_LOGO, height: 200,width:200 ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.fromLTRB(LEFT_MARGIN, WELCOME_TOP_MARGIN, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.only(left:PADDING_ALL_12),
                          //color: Colors.blue,
                          child: Text(
                             "Welcome", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: FONT_SIZE_WELCOME
                          ),
                            )

                          ),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                            padding: EdgeInsets.only(left:PADDING_ALL_12),
                            //color: Colors.blue,
                            child: Text(
                              "Manage your expenses",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: FONT_SIZE_MEDIUM,
                                color: Colors.white
                              ),
                            )

                        ),
                        Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN, RIGHT_MARGIN, NO_MARGIN),
                            padding: EdgeInsets.only(left:PADDING_ALL_12),
                            //color: Colors.blue,
                            child: Text(
                              "Seamless and Intuitive",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: FONT_SIZE_MEDIUM,
                                  color: Colors.white
                              ),
                            )

                        ),

                       Container(
                         alignment: Alignment.center,
                         margin: EdgeInsets.fromLTRB(LEFT_MARGIN,Button_TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                          padding: EdgeInsets.all(PADDING_ALL_12),
                         child: Row(
                           //crossAxisAlignment: CrossAxisAlignment.stretch,
                           //mainAxisSize: MainAxisSize.max,
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             Expanded(
                              child:RaisedButton(

                               elevation: 8.0,
                               onPressed: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => SignupScreen(context))),
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(22.0)
                               ),
                               padding: EdgeInsets.all(PADDING_ALL_12),
                               child :Row(
                                 children:[
                                   Image.asset(
                                       ICON_SIGNUP,
                                     alignment: Alignment.centerLeft,
                                   ),
                                   Padding(
                                     padding: EdgeInsets.only(left:(PADDING_ALL_16*7.0)),
                                   ),
                                   Text(
                                     "Sign up",

                                     style: TextStyle(
                                         color: Color(HOME_APP_BAR_COLOR),
                                         fontSize: FONT_SIZE_MEDIUM
                                     ),textAlign: TextAlign.center,
                                   )
                                 ],
                               ),
                             )
                             )
                           ],
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
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => SigninScreen()));
                                    },
                                    child: Text("Sign in",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: FONT_SIZE_MEDIUM-2
                                    ),),

                                  )
                                ])
                        ),
                      ],
                    )
                  ],


              ),
            ),
      );
  }
}