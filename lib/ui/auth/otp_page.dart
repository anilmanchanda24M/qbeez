import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qubeez/preference/preference_keys.dart';
import 'package:qubeez/preference/qbeez_prefs.dart';
import 'package:qubeez/ui/auth/bloc/ResendOtpBloc.dart';
import 'package:qubeez/ui/auth/bloc/VerifyOtpBloc.dart';
import 'package:qubeez/ui/auth/create_new_password_page.dart';
import 'package:qubeez/ui/dashboard.dart';
import 'package:qubeez/ui/dialogs/SuccessTaskDialog.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/appcolors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';
import 'package:sms_otp_auto_verify/sms_otp_auto_verify.dart';

class OtpPage extends StatefulWidget{
  String otp, phone, fromPage;
  OtpPage(this.phone, this.otp, this.fromPage);

    @override
    _OtpPage createState() => _OtpPage();
}

class _OtpPage extends State<OtpPage>{

  Timer _timer;
  int _start = 30;
  bool resendOtpVisible = false;
  String otpValue;
  final TextEditingController _otpFieldController = TextEditingController();
  final GlobalKey<FormState> _formStateKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  VerifyOtpBloc _verifyOtpBloc = VerifyOtpBloc();
  ResendOtpBloc _resendOtpBloc = ResendOtpBloc();

  @override
  void initState() {
    super.initState();
    _otpFieldController.text = widget.otp;
    _getAppSignature();
    _startListeningSms();
    startTimer();

    otpValue = widget.otp;

    _verifyOtpBloc.verifyOtpStream.listen((event) {
      if (event.status == true) {
        AppUtils.currentUser = event.data;
        AppUtils.walletData = event.walletData;
        QbeezPrefs.saveUser(userKeys, jsonEncode(event.data.toJson()));
        print("userAccessToken -> ${event.data.access_token}");
        userVerifiedSuccessfully(event.message);
      } else {
        AppUtils.showError(event.message, _globalKey);
        print(event.message);
      }
    });

    _verifyOtpBloc.errorStream.listen((event) {
      AppUtils.showError(event.stackTrace.toString(), _globalKey);
    });

    _verifyOtpBloc.loadingStream.listen((event) {
      if (context != null) {
        if (event) {
          AppUtils.showLoadingDialog(context);
        } else {
          Navigator.pop(context);
        }
      }
    });

    _resendOtpBloc.resendOtpStream.listen((event) {
      if (event.status == true) {
        otpValue = event.otp;

        startTimer();
        setState(() {
          _otpFieldController.text = event.otp;
          print("otp :: ${event.otp}");
        });
      } else {
        AppUtils.showError(event.message, _globalKey);
        print(event.message);
      }
    });

    _resendOtpBloc.errorStream.listen((event) {
      AppUtils.showError(event.stackTrace.toString(), _globalKey);
    });

    _resendOtpBloc.loadingStream.listen((event) {
      if (context != null) {
        if (event) {
          AppUtils.showLoadingDialog(context);
        } else {
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
    _otpFieldController?.dispose();
    _resendOtpBloc?.dispose();
    _verifyOtpBloc?.dispose();

    ///stopListening
    SmsRetrieved.stopListening();
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
                                            if(widget.fromPage == 'forgot'){
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (_) => CreateNewPasswordPage(widget.phone, otpValue)));
                                            }else{
                                              _verifyOtpBloc.verifyOtp(widget.phone, otpValue);
                                            }
                                          }
                                        },
                                      ),
                                    ),
                                  ),),
                                alignment: Alignment.centerRight,)
                            ],
                          ),
                        ),
                        Visibility(
                            visible: !resendOtpVisible,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(8, 20, 0, 12),
                              child: RichText(
                                text: TextSpan(
                                    style:
                                    TextStyle(fontSize: 14, color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Poppins'),
                                    text: "Resend code in ",
                                    children: [
                                      TextSpan(
                                          text: "$_start seconds",
                                          style: TextStyle(color: Colors.white, fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Poppins'))
                                    ]),
                              ),
                            )),
                        Visibility(
                            visible: resendOtpVisible,
                            child: InkWell(
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(8, 20, 0, 12),
                                child: Text("Resend OTP",
                                    style: TextStyle(fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: 'Poppins',
                                        color: Colors.white)
                                ),
                              ), onTap: (){
                              _resendOtpBloc.resendOtp(widget.phone);
                            },
                            ))
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

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start <= 1) {
            resendOtpVisible = true;
            timer.cancel();
          } else {
            _start = _start - 1;
          }
        },
      ),
    );
  }

  Future<Null> userVerifiedSuccessfully(String message) async {
    String returnVal = await showDialog(context: context, builder: (_) {
      return SuccessTaskDialog(message);
    });

    if (returnVal == 'success') {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          Dashboard()), (Route<dynamic> route) => false);
    }
  }

  /// Get signature code
  _getAppSignature() async {
    String signature = await SmsRetrieved.getAppSignature();
    print("App Hash Key:  $signature");
  }

  ///Here ListeningSms
  _startListeningSms() async {
    String otp = await SmsRetrieved.startListeningSms();
    print("Otp value :- ${otp.replaceAll("<#>Your OTP is: ", "")}");
    if (otp.isNotEmpty || otp != null) {
      _otpFieldController.text = otp.replaceAll("<#>Your OTP is: ", "").split(" ")[0];
    }
  }
}