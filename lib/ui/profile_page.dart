import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeez/utils/appcolors.dart';
import 'package:qubeez/utils/ui.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 74,
                    color: kPrimaryColor,
                ),
                Expanded(child: Container(
                  color: Colors.grey.shade100,
                ))
              ],
            ),
            SingleChildScrollView(
              child: Container(
                width: double.infinity,
                // color: Colors.grey[200],
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 24,),
                    Center(
                        child: ClipOval(
                          child: Container(
                            height: 120,
                            width: 120,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Icon(Icons.person, size: 44, color: kPrimaryColor,),
                            ),
                          ),
                        )
                    ),
                    SizedBox(height: 12,),
                    Text("Samim Akhter",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: kPrimaryColor
                      ),),
                    SizedBox(height: 4,),
                    Padding(padding: EdgeInsets.only(left: 4),
                        child: InkWell(
                          child: Text("+974 12451 13526",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                decoration: TextDecoration.underline
                            ),),
                          onTap: (){
                            /* Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => ProfilePage()));*/
                          },
                        )),
                    Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          elevation: 4.0,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(16),
                              height: 180,
                              child: ListView(
                                shrinkWrap: false,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Text(
                                    "Account Info",
                                    style: TextStyle(fontSize: 12, color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  SizedBox(height: 12,),
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                    title: Text("Mobile Number"),
                                    subtitle: Text("+974 12451 13526"),
                                    leading: Icon(Icons.phone, color: kPrimaryColor,),
                                  ),
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                    title: Text("Language"),
                                    subtitle: Text("English"),
                                    leading: Icon(Icons.language, color: kPrimaryColor,),
                                  )
                                ],
                              )
                          )
                      ),),
                    Padding(padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                      child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          elevation: 4.0,
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.all(12),
                              height: 340,
                              child: ListView(
                                shrinkWrap: false,
                                physics: const NeverScrollableScrollPhysics(),
                                children: [
                                  Text(
                                    "Privacy & Security",
                                    style: TextStyle(fontSize: 12, color: Colors.black,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                    title: Text("Privacy "),
                                    subtitle: Text("Sharing and visibility"),
                                    leading: Icon(Icons.lock_outline, color: kPrimaryColor,),
                                  ),
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                    title: Text("Notification"),
                                    subtitle: Text("Turn notifications On/Off"),
                                    leading: Icon(Icons.notifications_none, color: kPrimaryColor,),
                                  ),
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                    title: Text("Security"),
                                    subtitle: Text("Security Pin"),
                                    leading: Icon(Icons.security, color: kPrimaryColor,),
                                  ),
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                    title: Text("Help & Feedback"),
                                    leading: Icon(Icons.help, color: kPrimaryColor,),
                                  ),
                                  ListTile(
                                    visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                                    title: Text("Logout"),
                                    subtitle: Text("Logout from Qbeez"),
                                    leading: Icon(Icons.notifications_none, color: kPrimaryColor,),
                                  )
                                ],
                              )
                          )
                      ),),
                    // SizedBox(height: 12,),
                    ListTile(
                      visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
                      title: Text("Terms and Conditions"),
                      leading: Icon(Icons.check_circle_outline, color: kPrimaryColor,),
                    ),
                    SizedBox(height: 12,),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
