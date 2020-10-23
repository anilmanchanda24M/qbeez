import 'package:flutter/material.dart';
import 'package:qubeez/ui/dashboard.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

class OTPScreen extends StatefulWidget{
    @override
    _OTPScreen createState() => _OTPScreen();
}
class _OTPScreen extends State<OTPScreen>{

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
            SingleChildScrollView(
              child: Column(

              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  //color:Colors.blue,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN,RIGHT_MARGIN, BOTTOM_MARGIN),
                  padding: EdgeInsets.all(PADDING_ALL_12),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(LEFT_MARGIN,TOP_MARGIN_EXTRA,RIGHT_MARGIN, NO_MARGIN),
                  padding: EdgeInsets.all(PADDING_ALL_16),
                  child: Image.asset(QUBEEZ_LOGO, height: 200,width:200 ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN, RIGHT_MARGIN, NO_MARGIN),
                    padding: EdgeInsets.only(left:PADDING_ALL_12),
                    //color: Colors.blue,
                    child: Text(
                      "Phone Verification", style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: FONT_SIZE_MEDIUM-3
                    ),
                    )

                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN, RIGHT_MARGIN, NO_MARGIN),
                    padding: EdgeInsets.only(left:PADDING_ALL_12),
                    //color: Colors.blue,
                    child: Text(
                      "Enter your OTP code below",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: FONT_SIZE_LARGE,
                          color: Colors.white,

                      ),
                    )

                ),
                Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.fromLTRB(LEFT_MARGIN, TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                    padding: EdgeInsets.only(left:PADDING_ALL_12),
                    //color: Colors.blue,
                    child: Text(
                      "Please send the verification code send to +91 8888888888",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: FONT_SIZE_MEDIUM,
                          color: Colors.white
                      ),
                      textAlign: TextAlign.center,
                    )

                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(LEFT_MARGIN,TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                  padding: EdgeInsets.all(PADDING_ALL_12),
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    maxLength: 6,

                    maxLines: 1,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      /*suffixIcon:InkWell(
                        *//*decoration: ShapeDecoration(
                        color: Colors.red,
                        shape: CircleBorder()
                        ),*//*
                        child: IconButton(

                        icon: Icon(
                        Icons.arrow_forward

                        )
                          ,color: Colors.white,
                          onPressed: (){},

                      ) ,
                    ),*/

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(26.0),

                      )
                    )
                    )
                    ),

                  ),

                Container(
                  child: IconButton(
                     splashRadius: 2.0,
                    onPressed: ()=>Navigator.push(context,MaterialPageRoute(builder: (context) => Dashboard())),
                     splashColor: Color(HOME_APP_BAR_COLOR),
                     color: Color(HOME_APP_BAR_COLOR),
                    icon: Icon(
                      Icons.arrow_forward, color: Colors.white,
                    ),
                  ),
                ),
                Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.fromLTRB(LEFT_MARGIN,TOP_MARGIN_EXTRA, RIGHT_MARGIN, NO_MARGIN),
                    padding: EdgeInsets.all(PADDING_ALL_12),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [

                          Text(
                            "Resend code in 10 seconds",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: FONT_SIZE_MEDIUM-2),
                          ),

                        ])
                ),
              ],
            )
            )
          ],


        ),
      ),
    );
  }
}