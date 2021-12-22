import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netbazar/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Contact Us.dart';
import 'home.dart';
import 'listproduct.dart';
import 'login.dart';

class mainDrawer extends StatefulWidget {
  @override
  _mainDrawerState createState() => _mainDrawerState();
}

class _mainDrawerState extends State<mainDrawer> {
  String user_name = "";
  String mail = "";

  @override
  void initState() {
    GetSharePref();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Color(0xFFffdb98),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage("image/pencil.png"),
            ),
            accountName: Text(
              "${user_name}",
              style: TextStyle(color: Color(0xFF876555), fontSize: 18),
            ),
            accountEmail: Text(
              "${mail}",
              style: TextStyle(color: Color(0xFF876555), fontSize: 16),
            ),
          ),
          /* DrawerHeader(

            decoration: BoxDecoration(color: Color(0xFFffdb98),),
              child: //Text("Drawer header")
              Column(

                children: [
                  Container(
                      alignment: Alignment.topLeft,child: Icon(Icons.account_box,size: 50,)),
                  Container(
                      alignment: Alignment.topLeft,child: Text('User Name')),
                  Container(
                      alignment: Alignment.topLeft,child: Text('Username@gmail.com')),
                ],
              )),*/
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => home()));
              Fluttertoast.showToast(
                  msg: 'Home', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.account_box),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => profile()));
              Fluttertoast.showToast(
                  msg: 'Profile', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('List Menu'),
            leading: Icon(Icons.add_chart),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => listproduct()));
              Fluttertoast.showToast(
                  msg: 'List Menu', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('Order List'),
            leading: Icon(Icons.add_shopping_cart_outlined),
            onTap: () {
              Fluttertoast.showToast(
                  msg: 'Order List', toastLength: Toast.LENGTH_LONG);
            },
          ),
          Divider(
            thickness: 3,
          ),
          ListTile(
            title: Text('Contact Us'),
            leading: Icon(Icons.add_ic_call_rounded),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactUs()));
              Fluttertoast.showToast(
                  msg: 'Contact Us', toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.logout),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => login()));
              Fluttertoast.showToast(
                  msg: 'Log Out', toastLength: Toast.LENGTH_LONG);
            },
          ),
        ],
      ),
    );
  }

  GetSharePref() async {
    final preff = await SharedPreferences.getInstance();
    setState(() {
      user_name = preff.getString("userName")!;
      mail = preff.getString("user_Email")!;
    });
  }
}
