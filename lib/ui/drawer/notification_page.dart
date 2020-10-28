import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeez/utils/appcolors.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            primary: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return NotificationItem();
            }),
      ),
    );
  }

  Widget NotificationItem(){
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(6),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey[400]),
          borderRadius: BorderRadius.all(Radius.circular(5.0))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipOval(
            child: Container(
              height: 60,
              width: 60,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Icon(Icons.person, size: 30, color: kPrimaryColor,),
              ),
            ),
          ),
          SizedBox(width: 16,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("You received a payment of Rs. 120.00 from John smith",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87
                ),),
              SizedBox(height: 10),
              Text("Today, 1:01 PM",
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                ),),
            ],
          ))
        ],
      ),
    );
  }
}
