
import 'package:flutter/material.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/ui.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class ScanScreen extends StatefulWidget {

  // todo to be implemented
  // BuildContext prevContext;
  //
  // ScanScreen(this.prevContext);

  @override
  ScanWidget createState() => ScanWidget();
}

class ScanWidget extends State<ScanScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(HOME_APP_BAR_COLOR),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          // todo to be implemented when start back
          // onPressed: () => Navigator.pop(widget.prevContext),
        ),
        title: Text("Receive Money",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16.0)),
      ),
      body: new Container(
        margin: EdgeInsets.only(bottom: 30.0, top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Center(
                child: Text('Show This Screen to Qbeez User', style: TextStyle(fontSize: 18.0, color: Color(HOME_APP_BAR_COLOR)),),
              ),
              flex:1,
            ),
           Flexible(
             child: Container(child: Image(image: AssetImage(BAR_CODE),),
               margin: EdgeInsets.only(bottom: 40.0),
               height:220.0,
               width: 220.0,),
             flex: 4,
           ),
           Flexible(
             child: Center(
               child: Column(
                 // mainAxisSize: MainAxisSize.max,
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Container(
                     margin: EdgeInsets.all(10.0),
                     child: Text('Payent Code for Mobile Number', style: TextStyle(fontSize: 14.0, color: Color(HOME_APP_BAR_COLOR)),),
                   ),

                   Container(
                     margin: EdgeInsets.only(top: 15.0),
                     child: Text('Katharina', style: TextStyle(fontSize: 22.0, color: Color(HOME_APP_BAR_COLOR)),),
                   ),

                   Container(
                     margin: EdgeInsets.only(top: 15.0),
                     child: Text('+974 202-555-0161', style: TextStyle(fontSize: 22.0, color: Color(HOME_APP_BAR_COLOR)),),
                   ),

                 ],
               ),
             ),
             flex: 4,
           ),
           Flexible(
             child: FlatButton(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(18.0),
                   side: BorderSide(color: Colors.red)),
               color: Color(HOME_APP_BAR_COLOR),
               textColor: Colors.red,
               padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 50.0, right: 50.0),
               onPressed: () {
                 showAlertDialog(context);
               },
               child: Text(
                 "Enter Amount",
                 style: TextStyle(
                   fontSize: 17.0,
                   color: Colors.white
                 ),
               ),
             ),
             flex: 2,
           )
          ],
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context) {
  Alert(
    context: context,
    title: "Enter the amount you want",
    content: Container(
      margin: EdgeInsets.only(top: 10.0),
      child: new TextFormField(
        style: TextStyle(fontSize: 15.0),
        decoration: new InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Enter Amount',
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Color(HOME_APP_BAR_COLOR), width: 3.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
          contentPadding: EdgeInsets.all(8.0),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              borderSide: BorderSide(color: Color(HOME_APP_BAR_COLOR))),
        ),
        maxLines: 1,
        // validator: (value) {
        //   return formValidator(value, MobileField);
        // },
      ),
    ),
    buttons: [
      DialogButton(
        radius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(color: Color(HOME_APP_BAR_COLOR)),
        child: Text(
          "CANCEL",
          style: TextStyle(color: Color(HOME_APP_BAR_COLOR), fontSize: 18),
        ),
        onPressed: () => Navigator.pop(context),
        color: Colors.white,
      ),
      DialogButton(
        radius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.all(color: Colors.white),
        child: Text(
          "PAY",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () => Navigator.pop(context),
        // gradient: LinearGradient(colors: [
        //   Color.fromRGBO(116, 116, 191, 1.0),
        //   Color.fromRGBO(52, 138, 199, 1.0)
        // ]),
        color: Color(HOME_APP_BAR_COLOR),
      )
    ],
  ).show();
}