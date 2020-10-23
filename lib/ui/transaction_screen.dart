
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/str_app.dart';
import 'package:qubeez/utils/ui.dart';

class TransactionScreen extends StatefulWidget{
  @override
  _TransactionScreen createState() => _TransactionScreen();
}

class _TransactionScreen extends State<TransactionScreen>{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          appBar:AppBar(elevation:0.0,backgroundColor: Color(HOME_APP_BAR_COLOR),),
          body: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: PADDING_ALL_16),
            child: Container(
              child:Column(
                  children:[
                Container(
                  height: 200.0,
                  color:Color(HOME_APP_BAR_COLOR),
                  child: Center(
                    child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: PADDING_ALL_16),
                          ),
                                ImageIcon(
                                        AssetImage(TRANSACTION_SUCCESSFUL_IMG
                                        ) ,
                                  color: Colors.white,
                                ),

                          Text(
                            TRANSACTION_SUCCESS,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                            ),textAlign: TextAlign.center,
                          ),
                          Text(
                            "23 september 2020 at 20:21",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                            ),textAlign: TextAlign.center,
                          )
                        ],
                    ),
                  ),
                ),
                    Card(
                       child: Row(
                        children:[
                          Padding(
                            padding: EdgeInsets.only(left:PADDING_ALL_12),
                          ),
                          Expanded(

                           child:Text("Transaction ID QB2417884766488762476276",
                           style: TextStyle(
                             color: Colors.black,
                             fontSize: 14.0
                           ),)
                         ),
                          FlatButton(
                            onPressed: ()=>null,
                            child: Text(
                              "COPY",
                              style: TextStyle(
                                 color: Color(HOME_APP_BAR_COLOR),
                                fontSize: 18.0
                              ),
                            ),
                          )
                        ]
                       ),
                    ),
                    Padding(
                      padding:EdgeInsets.all(PADDING_ALL_12)
                    ),
                    Card(
                      elevation: 5.0,
                      margin: EdgeInsets.only(left:LEFT_MARGIN,right:RIGHT_MARGIN),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16.0))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(PADDING_ALL_12),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                           child:Text(
                              PAID_TO,
                              textAlign: TextAlign.left,
                            )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:PADDING_ALL_16),
                            ),
                            Row(
                              children: [
                                Image.asset(TRANSACTION_SUCCESSFUL_QR_IMG),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: PADDING_ALL_16),
                                      child: Column(
                                      children: [
                                        Text("Nazeem",style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.black
                                        ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(top:PADDING_ALL_8),
                                        ),
                                        Text("Freeslab Company",style: TextStyle(
                                            fontSize: 16.0,

                                        ),
                                        )
                                      ],
                                ),
                                    )
                                ),
                                Text(
                                  "2000.00",
                                  style: TextStyle(
                                    color: Color(HOME_APP_BAR_COLOR),
                                    fontSize: 16.0
                                  ),
                                )
                              ],
                            ),
                            Container(

                              alignment: Alignment.centerRight,
                              child: FlatButton(
                                onPressed: ()=>null,
                                child: Text("Make New Payment",
                                style: TextStyle(
                                  color: Color(HOME_APP_BAR_COLOR),
                                  fontSize: 16.0
                                ),
                                ),

                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: PADDING_ALL_12),
                    ),
                    Card(
                      elevation: 5.0,
                      margin: EdgeInsets.only(left:LEFT_MARGIN,right:RIGHT_MARGIN),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(16.0))
                      ),
                      child: Container(
                        padding: EdgeInsets.all(PADDING_ALL_12),
                        child: Column(
                          children: [
                            Container(
                                alignment: Alignment.centerLeft,
                                child:Text(
                                  "From Your",
                                  textAlign: TextAlign.left,
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(top:PADDING_ALL_16),
                            ),
                            Row(
                              children: [
                                Image.asset(TRANSACTION_SUCCESSFUL_Q_WALLET_IMG),
                                Expanded(
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      padding: EdgeInsets.only(left: PADDING_ALL_16),
                                      child: Column(
                                        children: [
                                          Text("Qbeez Wallet",style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.black
                                          ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(top:PADDING_ALL_8),
                                          ),
                                          Text("+974 1265362576",style: TextStyle(
                                            fontSize: 16.0,

                                          ),
                                          )
                                        ],
                                      ),
                                    )
                                ),

                              ],
                            ),

                          ],
                        ),
                      ),
                    )
                    ,
                    Padding(
                      padding: EdgeInsets.only(top: PADDING_ALL_16+6.0),
                    ),

                    Container(

                      child: RaisedButton(
                        elevation: 5.0,
                        onPressed: ()=>null,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18.0))
                        ),
                        padding: EdgeInsets.symmetric(vertical: PADDING_ALL_12, horizontal: PADDING_ALL_16*4.0),
                        color: Color(HOME_APP_BAR_COLOR),
                        child: Text("DONE",
                        style: TextStyle(
                          color: Colors.white
                        ),),
                      )
                    )

              ],

        )
            ),
          ),
        ),
    );
  }
}