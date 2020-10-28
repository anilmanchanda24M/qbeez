import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

import 'bloc/ResendOtpBloc.dart';
import 'otp_page.dart';

class ForgotPasswordPage extends StatefulWidget {
  @override
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {

  final GlobalKey<FormState> _formStateKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  TextEditingController _emailPhoneController = TextEditingController();
  bool isEmail = false;
  String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  ResendOtpBloc _resendOtpBloc = ResendOtpBloc();

  @override
  void initState() {
    super.initState();

    _resendOtpBloc.resendOtpStream.listen((event) {
      if (event.status == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OtpPage(_emailPhoneController.text.toString(),
                    event.otp, "forgot")));

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
    _resendOtpBloc?.dispose();
    _emailPhoneController?.dispose();
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
          Positioned(
              child: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(30, 12, 20, 20),
                  child: SafeArea(
                    child: Form(
                      key: _formStateKey,
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
    height: 60,
    ),
                          Text(
                            "Forgot Password",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Please enter your registered Email or Mobile number and "
                                "we will send you a verification code so that you can reset your password.",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 16,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 45,
                          ),
                          Padding(padding: EdgeInsets.only(left: 8),
                            child: Text(
                              "Email/Mobile Number",textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold
                              ),
                            ),),
                          SizedBox(height: 8,),
                          TextFormField(
                            controller: _emailPhoneController,
                            decoration: InputDecoration(
                                hintText: "Enter your email/mobile number",
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  color: Colors.purple,),
                                filled: true,
                                fillColor: Colors.white,
                                hintStyle: TextStyle(
                                    fontSize: 14
                                ),
                                errorStyle: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white
                                ),
                                contentPadding: EdgeInsets.symmetric(vertical: 5),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(30.0))
                                )
                            ),
                            onChanged: (value){
                              // RegExp regExpEmail = new RegExp(emailPattern);
                              RegExp regExpMobile = new RegExp(mobilePattern);
                              if(regExpMobile.hasMatch(value)){
                                isEmail = false;
                              }else{
                                isEmail = true;
                              }
                            },
                            style: TextStyle(
                                color: Colors.purple),
                            validator: (v) {
                              RegExp regExpEmail = new RegExp(emailPattern);
                              RegExp regExpMobile = new RegExp(mobilePattern);
                              if (v.isEmpty) {
                                return '* Email/Mobile Number is required';
                              } else{
                                if (isEmail) {
                                  if(!regExpEmail.hasMatch(v)){
                                    return '* Please enter valid email address';
                                  }else{
                                    return null;
                                  }
                                }else{
                                  if(!regExpMobile.hasMatch(v)){
                                    return '* Please enter valid mobile number';
                                  }else if(v.length < 10){
                                    return '* Please enter valid mobile number';
                                  }else{
                                    return null;
                                  }
                                }
                              }
                              return null;
                            },
                          ),
                          SizedBox(height: 40,),
                          Container(
                            child: Center(
                              child: RaisedButton(
                                  elevation: 8.0,
                                  onPressed: (){
                                    /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => OtpPage("8920547478", "588892")));*/
                                    if (_formStateKey.currentState.validate()) {
                                      String fieldValue = _emailPhoneController.text.toString();
                                      _resendOtpBloc.resendOtp(fieldValue);
                                    }
                                  },
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0)),
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                                    child: Text(
                                      "Submit",
                                      style: TextStyle(
                                          color: Color(HOME_APP_BAR_COLOR),
                                          fontSize: FONT_SIZE_MEDIUM),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.white),
                                    text: "Already have an account? ",
                                    children: [
                                      TextSpan(
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Navigator.pop(context);
                                            },
                                          text: "Sign in",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))
                                    ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
