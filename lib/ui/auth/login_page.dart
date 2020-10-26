import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qubeez/ui/auth/bloc/LoginBloc.dart';
import 'package:qubeez/ui/auth/forgot_password_page.dart';
import 'package:qubeez/ui/auth/register_page.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool passwordVisible;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailPhoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  bool isEmail = false;
  String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  String mobilePattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  LoginBloc _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    passwordVisible = false;

    _loginBloc.loginStream.listen((event) {
      if (event.user != null) {

      } else {
        AppUtils.showError(event.message, _globalKey);
        print(event.message);
      }
    });

    _loginBloc.errorStream.listen((event) {
      AppUtils.showError(event.stackTrace.toString(), _globalKey);
    });

    _loginBloc.loadingStream.listen((event) {
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
    _loginBloc?.dispose();
    _emailPhoneController?.dispose();
    _passwordController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      body: Stack(
        children: [
          Positioned(child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(WELCOME_BACKGROUND_PATH),
                    fit: BoxFit.cover)),
          )),

          Positioned(child: SingleChildScrollView(
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(30, 12, 20, 8),
              child: SafeArea(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
                        child: InkWell(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back,
                            color: Colors.white,),
                        ),),
                      SizedBox(height: 16,),
                      Text("Sign in",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18.0,
                              color: Colors.white,
                              fontWeight: FontWeight.w700)),
                      SizedBox(height: 60,),

                      Text(
                        "Welcome Back",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white
                        ),
                      ),
                      SizedBox(height: 4,),
                      Text(
                        "Hello there, sign in to continue!",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            color: Colors.white
                        ),),
                      SizedBox(height: 45,),
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
                        style: TextStyle(
                            color: Colors.purple),
                        validator: (v) {
                          RegExp regExpEmail = new RegExp(emailPattern);
                          RegExp regExpMobile = new RegExp(mobilePattern);
                          if (v.isEmpty) {
                            return 'Email/Mobile Number is required';
                          } else{
                            if (isEmail) {
                              if(!regExpEmail.hasMatch(v)){
                                return 'Please enter valid email address';
                              }else{
                                return null;
                              }
                            }else{
                              if(!regExpMobile.hasMatch(v)){
                                return 'Please enter valid mobile number';
                              }else if(v.length < 10){
                                return 'Please enter valid mobile number';
                              }else{
                                return null;
                              }
                            }
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20,),
                      Padding(padding: EdgeInsets.only(left: 8),
                        child: Text(
                          "Password",textAlign: TextAlign.left,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),),
                      SizedBox(height: 8,),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: Colors.black,
                        obscureText: !passwordVisible,
                        keyboardType: TextInputType.visiblePassword,
                        style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                            fontWeight: FontWeight.w400
                        ),
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            prefixIcon: Icon(
                              Icons.lock_open,
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
                            suffixIcon: IconButton(
                                icon: Icon(passwordVisible ? Icons.visibility : Icons.visibility_off,
                                  color: Colors.purple,),
                                onPressed: (){
                                  setState(() {
                                    passwordVisible = !passwordVisible;
                                  });
                                }),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(30.0))
                            )
                        ),
                        validator: (v) {
                          if (v.isEmpty) {
                            return 'Password should be mandatory';
                          }else if(v.length < 8){
                            return 'Password should be atleast 8 characters';
                          }
                          return null;
                        },
                      ),
                      Padding(padding: EdgeInsets.fromLTRB(8, 12, 0, 30),
                        child: InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => ForgotPasswordPage()));
                          },
                          splashColor: Colors.purpleAccent,
                          child: Text("Forgot Password?", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                        ),),
                      Container(
                        child: Center(
                          child: RaisedButton(
                              elevation: 8.0,
                              onPressed: (){
                                if(_formKey.currentState.validate()){
                                  String emailFieldValue = _emailPhoneController.text.toString();
                                  String password = _passwordController.text.toString();

                                  _loginBloc.loginData(emailFieldValue, password);
                                }
                              },
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25.0)
                              ),
                              child : Padding(
                                padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                                child: Text(
                                  "Sign in",
                                  style: TextStyle(
                                      color: Color(HOME_APP_BAR_COLOR),
                                      fontSize: FONT_SIZE_MEDIUM
                                  ),textAlign: TextAlign.center,),
                              )
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Center(
                          child: RichText(
                            text: TextSpan(
                                style: TextStyle(fontSize: 12, color: Colors.white),
                                text: "Don't have an account? ",
                                children: [
                                  TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) => RegisterPage()));
                                        },
                                      text: "Sign up",
                                      style: TextStyle(color: Colors.white,
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
