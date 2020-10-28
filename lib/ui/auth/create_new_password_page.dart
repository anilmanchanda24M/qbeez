import 'package:flutter/material.dart';
import 'package:qubeez/ui/auth/bloc/ForgotPasswordBloc.dart';
import 'package:qubeez/ui/auth/login_page.dart';
import 'package:qubeez/ui/dialogs/SuccessTaskDialog.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';

class CreateNewPasswordPage extends StatefulWidget {
  String fieldValue, otp;
  CreateNewPasswordPage(this.fieldValue, this.otp);

  @override
  _CreateNewPasswordPageState createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {

  bool passwordVisible, confirmPasswordVisible;
  final GlobalKey<FormState> _formStateKey = GlobalKey();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  ForgotPasswordBloc _forgotPasswordBloc = ForgotPasswordBloc();

  @override
  void initState() {
    super.initState();
    passwordVisible = true;
    confirmPasswordVisible = true;
    _forgotPasswordBloc.forgotPasswordStream.listen((event) {
      if (event.status == true) {
        userVerifiedSuccessfully(event.message);
      } else {
        AppUtils.showError(event.message, _globalKey);
        print(event.message);
      }
    });

    _forgotPasswordBloc.errorStream.listen((event) {
      AppUtils.showError(event.stackTrace.toString(), _globalKey);
    });

    _forgotPasswordBloc.loadingStream.listen((event) {
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
    _forgotPasswordBloc?.dispose();
    _passwordController?.dispose();
    _confirmPasswordController?.dispose();
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
                              "Kindly reset your password",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: FONT_SIZE_LARGE,
                                color: Colors.white,

                              ),
                            )

                        ),
                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "New Password",textAlign: TextAlign.left,
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
                              hintText: "Enter your new password",
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
                              return '* New Password should be mandatory';
                            }else if(v.length < 8){
                              return '* New Password should be atleast 8 characters';
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 20,),
                        Padding(padding: EdgeInsets.only(left: 8),
                          child: Text(
                            "Confirm New Password",textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold
                            ),
                          ),),
                        SizedBox(height: 8,),
                        TextFormField(
                          controller: _confirmPasswordController,
                          cursorColor: Colors.black,
                          obscureText: !confirmPasswordVisible,
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
                                  icon: Icon(confirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                    color: Colors.purple,),
                                  onPressed: (){
                                    setState(() {
                                      confirmPasswordVisible = !confirmPasswordVisible;
                                    });
                                  }),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(30.0))
                              )
                          ),
                          validator: (v) {
                            if (v.isEmpty) {
                              return '* Confirm New Password should be mandatory';
                            }else if(v.length < 8){
                              return '* Confirm New Password should be atleast 8 characters';
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
                                  if(_formStateKey.currentState.validate()){
                                    String confirmPassword = _confirmPasswordController.text.toString();
                                    String password = _passwordController.text.toString();
                                    if(password == confirmPassword){
                                      _forgotPasswordBloc.forgotPassword(widget.fieldValue, password, widget.otp);
                                    }else{
                                      AppUtils.showError("Password not matched!", _globalKey);
                                    }
                                  }
                                },
                                color: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0)
                                ),
                                child : Padding(
                                  padding: EdgeInsets.fromLTRB(30, 12, 30, 12),
                                  child: Text(
                                    "Submit",
                                    style: TextStyle(
                                        color: Color(HOME_APP_BAR_COLOR),
                                        fontSize: FONT_SIZE_MEDIUM
                                    ),textAlign: TextAlign.center,),
                                )
                            ),
                          ),
                        ),
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

  Future<Null> userVerifiedSuccessfully(String message) async {
    String returnVal = await showDialog(context: context, builder: (_) {
      return SuccessTaskDialog(message);
    });

    if (returnVal == 'success') {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
          LoginPage()), (Route<dynamic> route) => false);
    }
  }
}
