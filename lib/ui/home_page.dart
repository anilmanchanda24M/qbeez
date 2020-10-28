import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeez/model/auth/user.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/appcolors.dart';
import 'package:qubeez/utils/ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  WalletData _walletData;

  @override
  void initState() {
    super.initState();
    _walletData = AppUtils.walletData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: _globalKey,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: EdgeInsets.all(12),
          child:   Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Card(
                color: Color(0xFFFFD8D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 4.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.width * 0.2,
                  child: Row(
                    children: [
                      Expanded(child: Text('Available Balance',
                          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400,
                              fontSize: 16))),
                      Expanded(child: Container(
                        child: Center(
                          child: RichText(
                            text: TextSpan(children: [
                              TextSpan(
                                  text: _walletData.open_balance,
                                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700,
                                      fontSize: 20)),
                              WidgetSpan(
                                child: Transform.translate(
                                  offset: const Offset(0, 6),
                                  child: Text(
                                    'QR',
                                    //superscript is usually smaller in size
                                    textScaleFactor: 0.7,
                                    style: TextStyle(color: Colors.black87,
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16),
                                  ),
                                ),
                              )
                            ]),
                          ),
                        ),
                      ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                color: Color(0xFFFFD8D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 4.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFFB22B39),
                        Color(0xFF59161D),
                      ],
                    )
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      Expanded(
                        flex:1,
                          child: Container(
                        child: Center(
                          child: SvgPicture.asset(SEND_RECEIVE_MONEY, fit: BoxFit.fill, color: Colors.white,),
                        ),
                      )),
                      SizedBox(
                        width: 1.6,
                        height: double.infinity,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          flex:2,
                          child: Container(
                            child: Center(
                              child: Text("Send & Receive",
                                textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w700,
                                color: Colors.white
                              ),),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                color: Color(0xFFFFD8D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 4.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFB22B39),
                          Color(0xFF59161D),
                        ],
                      )
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      Expanded(
                          flex:1,
                          child: Container(
                            child: Center(
                              child: SvgPicture.asset(TOP_UP, fit: BoxFit.fill, color: Colors.white,),
                            ),
                          )),
                      SizedBox(
                        width: 1.6,
                        height: double.infinity,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          flex:2,
                          child: Container(
                            child: Center(
                              child: Text("Top Up",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                color: Color(0xFFFFD8D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 4.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFB22B39),
                          Color(0xFF59161D),
                        ],
                      )
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      Expanded(
                          flex:1,
                          child: Container(
                            child: Center(
                              child: SvgPicture.asset(BOOKING_EVENTS, fit: BoxFit.fill, color: Colors.white,),
                            ),
                          )),
                      SizedBox(
                        width: 1.6,
                        height: double.infinity,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          flex:2,
                          child: Container(
                            child: Center(
                              child: Text("Booking & Events",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 34,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Card(
                color: Color(0xFFFFD8D8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0)),
                elevation: 4.0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFFB22B39),
                          Color(0xFF59161D),
                        ],
                      )
                  ),
                  width: MediaQuery.of(context).size.width,
                  // padding: EdgeInsets.all(16),
                  height: MediaQuery.of(context).size.width * 0.3,
                  child: Row(
                    children: [
                      Expanded(
                          flex:1,
                          child: Container(
                            child: Center(
                              child: SvgPicture.asset(TRANSACTION_HISTORY, fit: BoxFit.fill, color: Colors.white,),
                            ),
                          )),
                      SizedBox(
                        width: 1.6,
                        height: double.infinity,
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(
                          flex:2,
                          child: Container(
                            child: Center(
                              child: Text("Transaction History",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 32,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white
                                ),),
                            ),
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
