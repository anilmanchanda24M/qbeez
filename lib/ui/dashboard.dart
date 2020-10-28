import 'dart:collection';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeez/model/auth/user.dart';
import 'package:qubeez/preference/preference_keys.dart';
import 'package:qubeez/preference/qbeez_prefs.dart';
import 'package:qubeez/ui/auth/bloc/LogoutBloc.dart';
import 'package:qubeez/ui/drawer/about_us.dart';
import 'package:qubeez/ui/drawer/notification_page.dart';
import 'package:qubeez/ui/profile_page.dart';
import 'package:qubeez/ui/scan_page.dart';
import 'package:qubeez/ui/wallet_page.dart';
import 'package:qubeez/ui/welcome.dart';
import 'package:qubeez/utils/AppUtils.dart';
import 'package:qubeez/utils/appcolors.dart';

import '../utils/ui.dart';
import 'dashboard/bottomAppBar/fab_bottom_app_bar_notched.dart';
import 'dialogs/LogoutDialog.dart';
import 'home_page.dart';
import 'inbox_page.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  List<Map<String, Object>> _pages;
  final GlobalKey<ScaffoldState> _globalKey = new GlobalKey();
  int _selectedIndex = 0;
  ListQueue<int> _navigationQueue = ListQueue();

  LogoutBloc _logoutBloc = LogoutBloc();
  User _user;

  @override
  void initState() {
    super.initState();
    _user = AppUtils.currentUser;
    _pages = [
      {
        'page': HomePage(),
        'title': 'Hi Samuel!',
      },
      {
        'page': WalletPage(),
        'title': 'Wallet',
      },
      {
        'page': ScanPage(),
        'title': 'Scan',
      },
      {
        'page': AboutUsPage(),
        'title': 'About Us',
      },
      {
        'page': NotificationPage(),
        'title': 'Notifications',
      },
    ];
    _navigationQueue.addLast(_selectedIndex);


    _logoutBloc.logoutStream.listen((event) {
      if (event.status == true) {
        print("LogoutMessage -> ${event.message}");
        QbeezPrefs.deleteUser(userKeys);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
            WelcomeQubeez()), (Route<dynamic> route) => false);
        AppUtils.showError(event.message, _globalKey);
      } else {
        AppUtils.showError(event.message, _globalKey);
        print(event.message);
      }
    });

    _logoutBloc.errorStream.listen((event) {
      AppUtils.showError(event.stackTrace.toString(), _globalKey);
    });

    _logoutBloc.loadingStream.listen((event) {
      if (context != null) {
        if (event) {
          print("LoadingEvent -> $event :: $context");
          AppUtils.showLoadingDialog(context);
        } else {
          print("LoadingEvent -> $event :: $context");
          // Navigator.of(globalContext, rootNavigator: true).pop();
          Navigator.pop(context);
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  /*PreferredSize(child: AppBar(
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text("Hi Samuel!",
                style: TextStyle(fontSize: 20, color: kPrimaryColor, fontWeight: FontWeight.w700),),
              elevation: defaultTargetPlatform == TargetPlatform.android ? 0.0 : 0.0,
              leading: IconButton(
                icon: SvgPicture.asset(dashboardMenu, height: 24, width: 24, color: kPrimaryColor,),
                onPressed: () {
                  _globalKey.currentState.openDrawer();
                },
              ),
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.all(12),
                  child: ClipOval(
                    child: Container(
                      height: 40,
                      width: 40,
                      color: Colors.grey.shade300,
                      child: Padding(
                        padding: EdgeInsets.all(15),
                        child: Icon(Icons.person, size: 32, color: kPrimaryColor,),
                      ),
                    ),
                  ),
                )
              ],
            ), preferredSize: Size.fromHeight(80.0))*/

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.white,
            key: _globalKey,
            appBar: _selectedIndex == 0
                ? PreferredSize(child: SafeArea(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 8, 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(dashboardMenu, height: 24, width: 24, color: kPrimaryColor,),
                      onPressed: () {
                        _globalKey.currentState.openDrawer();
                      },
                    ),
                    Text("Hi ${_user.name}!",
                      style: TextStyle(fontSize: 24, color: kPrimaryColor, fontWeight: FontWeight.w700),),

                    ClipOval(
                        child: Container(
                          height: 64,
                          width: 64,
                          color: Colors.grey.shade300,
                          child: Padding(
                            padding: EdgeInsets.all(5),
                            child: Icon(Icons.person, size: 32, color: kPrimaryColor,),
                          ),
                        )
                    )
                  ],
                ),
              ),
            ), preferredSize: Size.fromHeight(80.0))
                : AppBar(
                title: Text(
                  _pages[_selectedIndex]['title'],
                  style: TextStyle(fontSize: 18),
                ),
                backgroundColor: kPrimaryColor,
                leading: IconButton(
                  icon: SvgPicture.asset(dashboardMenu, height: 24, width: 24),
                  onPressed: () {
                    _globalKey.currentState.openDrawer();
                  },
                ),
                elevation:
                    defaultTargetPlatform == TargetPlatform.android ? 5.0 : 0.0,
                centerTitle: _selectedIndex == 0 ? true : false,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (_) => Notifications()));
                    },
                  )
                ]),
            drawer: Drawer(
              child: ListView(
                children: [
                  createHeader(context),
                  createDrawerItems(context, "Home", Icons.home, () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectPage(0);
                    });
                  }),
                  createDrawerItems(
                      context, "My Wallet", Icons.account_balance_wallet, () {
                    Navigator.of(context).pop();
                    /*Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => BookAppointmentPage()));*/
                  }),
                  createDrawerItems(
                      context, "Notification", Icons.notifications_none, () {
                    // Navigator.pushNamed(context, Routes.prescriptionManagement);
                    Navigator.of(context).pop();
                    setState(() {
                      _selectPage(3);
                    });
                  }),
                  createDrawerItems(
                      context, "Invite Friend", Icons.insert_invitation, () {
                    Navigator.of(context).pop();
                  }),
                  /*createDrawerItems(context, "My Vouchers", Icons.verified_user,
                      () {
                    // Navigator.pushNamed(context, Routes.myChat);
                    Navigator.of(context).pop();
                  }),*/
                  createDrawerItems(context, "Rate Us", Icons.rate_review, () {
                    Navigator.of(context).pop();
                  }),
                  createDrawerItems(context, "About Us", Icons.info_outline,
                      () {
                    Navigator.of(context).pop();
                    setState(() {
                      _selectPage(2);
                    });
                  }),
                  Divider(
                    thickness: 1.5,
                    color: Colors.grey[400],
                  ),
                  createDrawerItems(context, "Support", Icons.help_outline, () {
                    Navigator.of(context).pop();
                  }),
                  createDrawerItems(context, "Language", Icons.language, () {
                    Navigator.of(context).pop();
                  }),
                  Divider(
                    thickness: 1.5,
                    color: Colors.grey[400],
                  ),
                  createDrawerItems(context, "Logout", Icons.person_outline,
                      () {
                    Navigator.of(context).pop();
                    getLogoutValue();
                  }),
                ],
              ),
            ),
            body: _pages[_selectedIndex]['page'],
            floatingActionButton: Padding(
              padding: EdgeInsets.only(top: 2),
              child: SizedBox(
                height: 74,
                width: 74,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 8,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        shape: BoxShape.circle,
                        color: kPrimaryColor),
                    child: Icon(Icons.qr_code_scanner, size: 36),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: FABBottomAppBar(
              onTabSelected: _selectPage,
              centerItemText: 'Scan',
              // backgroundColor: Colors.transparent,
              selectedColor: kPrimaryColor,
              color: Colors.grey.shade800,
              notchedShape: CircularNotchedRectangle(),
              items: [
                FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
                FABBottomAppBarItem(iconData: Icons.payment_outlined, text: 'Safe & Secure Payment'),
                FABBottomAppBarItem(iconData: Icons.info_outline, text: 'About Us'),
                FABBottomAppBarItem(iconData: Icons.notifications_none_outlined, text: 'Notification'),
              ],
            )),
        onWillPop: () async {
          if (_navigationQueue.isEmpty) return true;

          setState(() {
            _selectedIndex = _navigationQueue.last;
            _navigationQueue.removeLast();
          });
          return false;
        });
  }

  void _selectPage(int index) {
    _navigationQueue.addLast(index);
    setState(() {
      if(index == 2){
        _selectedIndex = index+1;
      }else if(index == 3){
        _selectedIndex = index+1;
      }else{
        _selectedIndex = index;
      }
    });
  }

  //Dashboard Navigation drawer header widget here...
  Widget createHeader(BuildContext context){
    return Container(
      height: 120,
      child:  DrawerHeader(
        decoration: BoxDecoration(color: Colors.grey[200],),
        child: Row(
          children: [
            Center(
                child: ClipOval(
                  child: Container(
                    height: 64,
                    width: 64,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: Icon(Icons.person, size: 30, color: kPrimaryColor,),
                    ),
                  ),
                )
            ),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24,),
                Text("Hello, ${_user.name}",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: kPrimaryColor
                  ),),
                SizedBox(height: 4,),
                Padding(padding: EdgeInsets.only(left: 4),
                    child: InkWell(
                      child: Text("+${_user.country_code} ${_user.mobile}",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            decoration: TextDecoration.underline
                        ),),
                      onTap: (){
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProfilePage()));
                      },
                    ))
              ],
            )
          ],

        ),),
    );
  }

  Future<Null> getLogoutValue() async {
    String returnVal = await showDialog(context: context, builder: (_) {
      return LogoutDialog();
    });

    if (returnVal == 'logout') {
      _logoutBloc.logout(_user.access_token);
    }
  }

  Widget createDrawerItems(BuildContext context, String title, IconData icon,  GestureTapCallback onTap){
    return ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -3),
        title: Text(title),
        leading: Icon(icon),
        onTap: onTap
    );
  }
}