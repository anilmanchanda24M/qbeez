import 'package:flutter/material.dart';
import 'package:qubeez/utils/custom_colors.dart';
import 'package:qubeez/utils/dimen/dimen.dart';
import 'package:qubeez/utils/str_app.dart';
import 'package:qubeez/utils/ui.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
          //drawer: Drawer(),
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Color(HOME_APP_BAR_COLOR),
            title: Text("Hi, Samuel",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0)),
            actions: [
              IconButton(
                  icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
              IconButton(
                icon: ImageIcon(
                  AssetImage(MENU_ICON),
                  color: Colors.white,
                ),
                onPressed: () => _scaffoldKey.currentState.openDrawer(),
              )
            ],
          ),
          body: Column(children: [
            SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  color: Color(HOME_APP_BAR_COLOR),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: PADDING_ALL_8),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(12.0))),
                        margin: EdgeInsets.all(MARGIN),
                        elevation: 8.0,
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: PADDING_ALL_16 + 10,
                                  horizontal: PADDING_ALL_16 - 6),
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Balance in the wallet',
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        color: Color(HOME_APP_BAR_COLOR)),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: Color(HOME_APP_BAR_COLOR),
                                    ),
                                  ),
                                ]),
                            Expanded(
                              child: Text(
                                "3891",
                                style: TextStyle(
                                    color: Color(HOME_APP_BAR_COLOR),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                                textAlign: TextAlign.right,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: PADDING_ALL_12),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(PADDING_ALL_12,PADDING_ALL_8-2,PADDING_ALL_12,0.0),
                      ),
                      Row(
                        children: [
                          Expanded(
                          child : Column(
                            children: [
                              IconButton(
                                icon: ImageIcon(
                                      AssetImage(PAY_ICON)
                                      ,color: Colors.white,
                                ),
                              ),
                              Text(PAY,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                          ),
                          Expanded(
                          child : Column(
                            children: [
                              IconButton(
                                icon: ImageIcon(
                                    AssetImage(ADD_MONEY_ICON)
                                    ,color: Colors.white

                                ),
                              ),
                              Text(
                                ADD_MONEY,
                                style: TextStyle(
                                  color: Colors.white,

                                ),
                              )
                            ],
                          ),
                          ),
                          Expanded(
                          child: Column(
                            children: [
                              IconButton(
                                icon:Icon(Icons.account_balance_wallet,color: Colors.white,),
                                  color: Colors.white,

                                ),
                              Text(
                                WALLET,
                                style: TextStyle(
                                  color: Colors.white
                                ),
                              )
                            ],
                          ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top:APP_BAR_MARGIN),
                      )
                    ],
                  ),
                ),


              ],
            )),

          ]),

          bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  title: Text("Home" ),
                  icon: Icon(
                    Icons.home,
                    color: Color(HOME_APP_BAR_COLOR),
                  ),

                ),
                BottomNavigationBarItem(
                  title: Text("")
                )

              ],
          ),
        ));
  }
}
