import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/hp/qbeez/lib/ui/auth/otp_page.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

import 'bloc/SignUpBloc.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  bool passwordVisible;
  final GlobalKey<FormState> _formStateKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  SignUpBloc _signUpBloc = SignUpBloc();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;

    _signUpBloc.signUpStream.listen((event) {
      if (event.status == true) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => OtpPage()));
      } else {
        AppUtils.showError(event.message, _globalKey);
        print(event.message);
      }
    });

    _signUpBloc.errorStream.listen((event) {
      AppUtils.showError(event.stackTrace.toString(), _globalKey);
    });

    _signUpBloc.loadingStream.listen((event) {
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
    _signUpBloc?.dispose();
    _nameController?.dispose();
    _emailController?.dispose();
    _phoneController?.dispose();
    _passwordController?.dispose();
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
                        height: 16,
                      ),
                      Text("Sign up",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        "Hello there, sign up to continue!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 45,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Name",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _nameController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.text,
                        textCapitalization: TextCapitalization.words,
                        decoration: InputDecoration(
                            hintText: "Enter your full name",
                            prefixIcon: Icon(
                              Icons.person_outline,
                              color: Colors.purple,
                            ),
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)))),
                        style: TextStyle(color: Colors.purple),
                        validator: (v) {
                          if (v.isEmpty) {
                            return '* Full Name should be mandatory';
                          } else if (v.length < 4) {
                            return '* Full Name should be 4 digits';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Phone Number",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.phone,
                        maxLength: 10,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14
                            ),
                            errorStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            ),
                            hintText: "Enter your phone number",
                            prefixIcon: Icon(
                              Icons.phone,
                              color: Colors.purple,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            counterText: "",
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30.0)))),
                        style: TextStyle(color: Colors.purple),
                        validator: (v) {
                          String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          RegExp regExp = new RegExp(pattern);

                          if (v.isEmpty) {
                            return '* Phone Number should be mandatory';
                          } else if (v.length != 10) {
                            return '* Phone Number should be 10 digits';
                          }else if (!regExp.hasMatch(v)) {
                            return '* Phone Number should be valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Email ID",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _emailController,
                        cursorColor: Colors.black,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14
                            ),
                            errorStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            ),
                            hintText: "Enter your email ID",
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.purple,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.all(Radius.circular(30.0)))),
                        style: TextStyle(color: Colors.purple),
                        validator: (v) {
                          String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
                          RegExp regExp = new RegExp(pattern);

                          if (v.isEmpty) {
                            return '* Email should be mandatory';
                          }else if (!regExp.hasMatch(v)) {
                            return '* Email should be Valid';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Password",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        obscureText: !passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                fontSize: 14
                            ),
                            errorStyle: TextStyle(
                                fontSize: 12,
                                color: Colors.white
                            ),
                            hintText: "Enter your password",
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.purple,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 5),
                            suffixIcon: IconButton(
                                icon: Icon(
                                  passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.purple,
                                ),
                                onPressed: () {
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                }),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30.0)))),
                        validator: (v) {
                          if (v.isEmpty) {
                            return '* Password should be mandatory';
                          } else if (v.length < 8) {
                            return '* Password should be atleast 8 characters';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Container(
                        child: Center(
                          child: RaisedButton(
                              elevation: 8.0,
                              onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => OtpPage()));
                                /*if (_formStateKey.currentState.validate()) {
                                  String fullName = _nameController.text.toString();
                                  String email = _emailController.text.toString();
                                  String phone = _phoneController.text.toString();
                                  String password = _passwordController.text.toString();

                                  _signUpBloc.signUpData(fullName, email, phone, password);
                                }*/
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
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => LoginPage()));
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
