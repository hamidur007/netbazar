import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netbazar/home.dart';
import 'package:netbazar/listproduct.dart';
import 'package:netbazar/profile.dart';

import 'Notifications.dart';
import 'Splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  PageController _pageController = PageController();
  List<Widget> pages = [home(), Notifications(), listproduct(), profile(),];

  int _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: pages,
        onPageChanged: onPagedChanged,
      ),
      bottomNavigationBar: FancyBottomNavigation(
        barBackgroundColor: Color(0xFFffdb98),
        tabs: [
          TabData(iconData: Icons.home, title: "Home"),
          TabData(iconData: Icons.add_alert_sharp, title: "Notification"),
          TabData(iconData: Icons.shopping_cart, title: "Product"),
          TabData(iconData: Icons.account_box, title: "Account"),
        ],
        initialSelection: _selectedIndex,
        inactiveIconColor: Color(0xFF876555),
        circleColor: Color(0xFF876555),
        onTabChangedListener: (position) {
          _pageController.jumpToPage(position);
          _selectedIndex=position;
        },
      ),
      /*bottomNavigationBar: BottomNavigationBarItem(
        backgroundColor: Colors.red,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.indigo,
        item: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),
            label: 'Home',
            activeIcon: Icon(Icons.map),
          ),
        ]
      ),*/
    );
  }

  void onPagedChanged(int value) {
    setState(() {
      _selectedIndex = value;
    });
  }
}
