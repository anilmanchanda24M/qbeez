import 'package:flutter/material.dart';
import 'package:qubeez/ui/dashboard.dart';
import 'package:qubeez/utils/appcolors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

class OtpPage extends StatefulWidget{
  String otp, phone;
  OtpPage(this.phone, this.otp);

    @override
    _OtpPage createState() => _OtpPage();
}

class _OtpPage extends State<OtpPage>{

  final TextEditingController _otpFieldController = TextEditingController();
  final GlobalKey<FormState> _formStateKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    _otpFieldController.text = widget.otp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Stack(
        children: [
          Positioned(
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(WELCOME_BACKGROUND_PATH),
                        fit: BoxFit.cover)),
              )),

          Positioned(child: SafeArea(
            child: SingleChildScrollView(
                child: Form(
                  key: _formStateKey,
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.fromLTRB(30, 12, 20, 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(NO_MARGIN,20,NO_MARGIN, NO_MARGIN),
                          child: Center(
                            child: Image.asset(QUBEEZ_LOGO, width: 150, height: 180, fit: BoxFit.fill),
                          ),
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
                                fontSize: 14
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
                              "Please enter the verification code send to +91 ${widget.phone}",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  fontSize: 14,
                                  color: Colors.white
                              ),
                              textAlign: TextAlign.center,
                            )

                        ),

                        Container(
                          margin: EdgeInsets.only(top: 25),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              TextFormField(
                                controller: _otpFieldController,
                                textAlign: TextAlign.center,
                                maxLength: 6,
                                decoration: InputDecoration(
                                    fillColor: Colors.white,
                                    filled: true,
                                    counterText: "",
                                    hintText: 'Enter your code here',
                                    contentPadding: EdgeInsets.symmetric(vertical: 5),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(25.0),
                                        )
                                    )
                                ),
                                validator: (v){
                                  if(v.isEmpty){
                                    return 'Please enter code here';
                                  }else if(v.length <6){
                                    return 'Please enter 6 digit code';
                                  }
                                  return null;
                                },
                              ),

                              Align(
                                child: Padding(padding: EdgeInsets.only(right: 8),
                                  child: ClipOval(
                                    child: Material(
                                      color: kPrimaryColor, // button color
                                      child: InkWell(
                                        splashColor: Colors.white, // inkwell color
                                        child: SizedBox(width: 32, height: 32,
                                            child: Icon(Icons.arrow_right_alt, color: Colors.white,)),
                                        onTap: (){
                                          if(_formStateKey.currentState.validate()){
                                            Navigator.push(context,MaterialPageRoute(
                                                builder: (context) => Dashboard()));
                                          }
                                        },
                                      ),
                                    ),
                                  ),),
                                alignment: Alignment.centerRight,)
                            ],
                          ),
                        ),
                        Padding(padding: EdgeInsets.fromLTRB(8, 20, 0, 12),
                          child: Text(
                            "Resend code in 10 seconds",textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          ),),
                      ],
                    ),
                  ),
                )
            ),
          ))
        ],


      ),
    );
  }
}