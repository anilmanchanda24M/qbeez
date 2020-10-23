
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/ui.dart';


class CustomerSupport extends StatefulWidget{
  @override
  _CustomerSupport createState()=> _CustomerSupport();
}

class _CustomerSupport extends State<CustomerSupport>{

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(HOME_APP_BAR_COLOR),
              elevation: 0.0,
              leading: Icon(
                Icons.arrow_back, color: Colors.white,
              ),
              title: Text(
                "Customer support",
                style: TextStyle(
                  color: Colors.white,

                ),textAlign: TextAlign.center,
              ),
            ),

            body: 
            
            SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    Image.asset(CUSTOMER_SUPPORT),
                    Container(
                      margin: EdgeInsets.fromLTRB(LEFT_MARGIN+2, TOP_MARGIN_EXTRA,RIGHT_MARGIN+2,NO_MARGIN),
                      child: Row(
                        children: [
                          Icon(
                            Icons.info_outline,color: Color(HOME_APP_BAR_COLOR),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left:PADDING_ALL_16),
                          ),
                          Text(
                            "Help Center",
                            style:TextStyle(
                              color: Color(HOME_APP_BAR_COLOR),
                                fontWeight: FontWeight.bold

                            )
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(LEFT_MARGIN+2, TOP_MARGIN_EXTRA,RIGHT_MARGIN+2,NO_MARGIN),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(HOME_APP_BAR_COLOR)
                        ),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "How can we help?",
                          hintStyle: TextStyle(color: Color(HOME_APP_BAR_COLOR)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(22.0)),
                            borderSide: BorderSide(color: Color(HOME_APP_BAR_COLOR))
                          )

                        ),
                      ),
                    ),
                    Container(

                      height: 200.0,
                      margin: EdgeInsets.fromLTRB(LEFT_MARGIN+2, TOP_MARGIN_EXTRA,RIGHT_MARGIN+2,NO_MARGIN),
                      child: TextField(
                        selectionHeightStyle: BoxHeightStyle.max,
                        minLines: 5,
                        maxLines: 8,
                        style: TextStyle(
                            fontSize: 18.0,
                            color: Color(HOME_APP_BAR_COLOR)
                        ),
                        decoration: InputDecoration(
                            filled: true,

                            fillColor: Colors.white,


                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(22.0)),
                                borderSide: BorderSide(color: Color(HOME_APP_BAR_COLOR))
                            )

                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(LEFT_MARGIN+2, TOP_MARGIN,RIGHT_MARGIN+2,NO_MARGIN),

                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: PADDING_ALL_12, horizontal: PADDING_ALL_16*2.0),
                        onPressed: (){},
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(18.0))
                         ),
                        color: Color(HOME_APP_BAR_COLOR),
                        
                        child: Text(
                          "Submit",
                          style: TextStyle(
                            color: Colors.white
                          ),
                        ),
                      )
                    )
                  ],
                ),


              ),
            ),
          ),
      );
  }
}