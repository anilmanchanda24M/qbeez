import 'dart:collection';

import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qubeez/ui/profile_page.dart';
import 'package:qubeez/ui/scan_page.dart';
import 'package:qubeez/ui/wallet_page.dart';
import 'package:qubeez/utils/appcolors.dart';

import '../utils/ui.dart';
import 'dashboard/bottomAppBar/fab_bottom_app_bar_notched.dart';
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

  @override
  void initState() {
    super.initState();

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
        'page': InboxPage(),
        'title': 'Inbox',
      },
      {
        'page': ProfilePage(),
        'title': 'Profile',
      },
    ];
    _navigationQueue.addLast(_selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
            backgroundColor: Colors.white,
            key: _globalKey,
            appBar: AppBar(
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
                      _selectedIndex = 0;
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
                  }),
                  createDrawerItems(
                      context, "Invite Friend", Icons.insert_invitation, () {
                    Navigator.of(context).pop();
                  }),
                  createDrawerItems(context, "My Vouchers", Icons.verified_user,
                      () {
                    // Navigator.pushNamed(context, Routes.myChat);
                    Navigator.of(context).pop();
                  }),
                  createDrawerItems(context, "Rate Us", Icons.rate_review, () {
                    Navigator.of(context).pop();
                  }),
                  createDrawerItems(context, "About Us", Icons.info_outline,
                      () {
                    Navigator.of(context).pop();
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
                  }),
                ],
              ),
            ),
            body: _pages[_selectedIndex]['page'],
            floatingActionButton: Padding(
              padding: EdgeInsets.only(top: 20),
              child: SizedBox(
                height: 70,
                width: 70,
                child: FloatingActionButton(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Container(
                    height: 75,
                    width: 75,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 4),
                        shape: BoxShape.circle,
                        color: kPrimaryColor),
                    child: Icon(Icons.qr_code_scanner, size: 40),
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            bottomNavigationBar: FABBottomAppBar(
              onTabSelected: _selectPage,
              centerItemText: 'Scan',
              selectedColor: kPrimaryColor,
              color: Colors.grey.shade400,
              notchedShape: CircularNotchedRectangle(),
              items: [
                FABBottomAppBarItem(iconData: Icons.home, text: 'Home'),
                FABBottomAppBarItem(iconData: Icons.account_balance_wallet, text: 'Wallet'),
                FABBottomAppBarItem(iconData: Icons.email_rounded, text: 'Inbox'),
                FABBottomAppBarItem(iconData: Icons.person, text: 'Profile'),
              ],
            ),
            /* bottomNavigationBar: FancyBottomNavigation(
            activeIconColor: Colors.white,
            inactiveIconColor: kSplashTextColor,
            circleColor: kPrimaryColor,
            initialSelection: _selectedIndex,
            textColor: kPrimaryColor,
            onTabChangedListener: _selectPage,
            barBackgroundColor: Colors.white,
            // type: BottomNavigationBarType.fixed,
            tabs: [
              TabData(iconData: Icons.home, title: "Home"),
              TabData(iconData: Icons.account_balance_wallet, title: "Wallet"),
              TabData(iconData: Icons.scanner, title: "Scan"),
              // TabData(iconData: Icons.email_rounded, title: "Inbox"),
              TabData(iconData: Icons.person, title: "Profile")
            ],
          ),*/
            ),
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
                    height: 70,
                    width: 70,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(15),
                      child: SvgPicture.asset(profile1Image, height:24, width:24,),
                    ),
                  ),
                )
            ),
            SizedBox(width: 16,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24,),
                Text("Hello, Samim",
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

  Widget createDrawerItems(BuildContext context, String title, IconData icon,  GestureTapCallback onTap){
    return ListTile(
        visualDensity: VisualDensity(horizontal: 0, vertical: -3),
//              dense:true,
//              contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
        title: Text(title),
        leading: Icon(icon),
        onTap: onTap
    );
  }
}

/*Container(
              height: 80.0,
              color: Colors.white,
              padding: new EdgeInsets.only(top: 20.0),
              child: new Theme(
                data: Theme.of(context).copyWith(
                    // sets the background color of the `BottomNavigationBar`
                    canvasColor: Colors.white,
                    // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                    primaryColor: Colors.red,
                    bottomAppBarColor: Colors.green,
                    textTheme: Theme.of(context)
                        .textTheme
                        .copyWith(caption: new TextStyle(color: Colors.grey))),
                // sets the inactive color of the `BottomNavigationBar`
                child: new BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    onTap: _selectPage,
                    unselectedItemColor: kSplashTextColor,
                    selectedItemColor: kPrimaryColor,
                    currentIndex: _selectedIndex,
                    items: [
                      BottomNavigationBarItem(
                          icon: new Icon(Icons.home),
                          title: new Text('Home'),
                          activeIcon: Icon(Icons.home, color: kPrimaryColor,)),
                      BottomNavigationBarItem(
                        icon: new Icon(Icons.account_balance_wallet_outlined),
                        title: new Text('Wallet'),
                          activeIcon: Icon(Icons.account_balance_wallet_outlined, color: kPrimaryColor,)
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(
                            Icons.bookmark_border,
                            color: Colors.transparent,
                          ),
                          title: Text('Scan')),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.email_outlined),
                          title: Text('Inbox'),
                          activeIcon: Icon(Icons.email_outlined, color: kPrimaryColor,)),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.perm_identity),
                          title: Text('Profile'),
                          activeIcon: Icon(Icons.perm_identity, color: kPrimaryColor,)),
                    ]),
              ),
            )*/