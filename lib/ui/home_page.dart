import 'package:flutter/material.dart';
import 'package:qubeez/utils/appcolors.dart';
import 'package:qubeez/utils/ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 1,
              child: Container(
            color: kPrimaryColor,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.0)),
                      elevation: 4.0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(width: 1,),
                              Text(
                                "Balance in the wallet",
                                style: TextStyle(fontSize: 12, color: kPrimaryColor),
                              ),
                              Text(
                                "3891",
                                style: TextStyle(fontSize: 24,
                                    fontWeight:FontWeight.bold,
                                    color: kPrimaryColor),
                              ),
                              SizedBox(width: 1,),
                            ],
                          ),
                        )
                    ),),
                    SizedBox(height: 4,),
                    Row(
                      children: [
                        Expanded(child: Column(
                          children: [
                            Icon(Icons.account_balance_wallet, size: 40, color: Colors.white,),
                            SizedBox(height: 4,),
                            Text("Pay",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),)
                          ],
                        )),
                        Expanded(child: Column(
                          children: [
                            Icon(Icons.account_balance_wallet, size: 40, color: Colors.white,),
                            SizedBox(height: 4,),
                            Text("Add Money",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),)
                          ],
                        )),
                        Expanded(child: Column(
                          children: [
                            Icon(Icons.account_balance_wallet, size: 40, color: Colors.white,),
                            SizedBox(height: 4,),
                            Text("Wallet",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white),)
                          ],
                        ))
                      ],
                    )
                  ],
                ),
          )),
          Expanded(
            flex: 2,
              child: Container(
            color: Colors.white,
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          elevation: 4.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 12,),
                                Image.asset(home2, width: 80, height: 80,),
                                Expanded(child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "User QR Code",
                                        style: TextStyle(fontSize: 18,
                                            fontWeight:FontWeight.w700,
                                            color: kPrimaryColor),
                                      ),
                                      Text(
                                        "Safe and Easy Steps",
                                        style: TextStyle(fontSize: 16,
                                            fontWeight:FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          )
                      ),),
                    Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          elevation: 4.0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(width: 12,),
                                Image.asset(home1, width: 80, height: 80,),
                                Expanded(child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "User Security",
                                      style: TextStyle(fontSize: 18,
                                          fontWeight:FontWeight.w700,
                                          color: kPrimaryColor),
                                    ),
                                    Text(
                                      "Safe and Comfortable",
                                      style: TextStyle(fontSize: 16,
                                          fontWeight:FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                          )
                      ),),
                  ],
                ),
          ))
        ],
      ),
    );
  }
}
