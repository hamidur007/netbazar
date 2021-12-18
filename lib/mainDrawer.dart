import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netbazar/profile.dart';

import 'home.dart';
import 'listproduct.dart';
import 'login.dart';
class mainDrawer extends StatelessWidget {
  const mainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            //decoration: BoxDecoration(color: Colors.green),
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
              )),
          ListTile(
            title: Text('Home'),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
              Fluttertoast.showToast(msg: 'Home',toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('Profile'),
            leading: Icon(Icons.account_box),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>profile()));
              Fluttertoast.showToast(msg: 'Profile',toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('List Menu'),
            leading: Icon(Icons.account_box),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>listproduct()));
              Fluttertoast.showToast(msg: 'List Menu',toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('Order List'),
            leading: Icon(Icons.add_shopping_cart_outlined),
            onTap: (){
              Fluttertoast.showToast(msg: 'Order List',toastLength: Toast.LENGTH_LONG);
            },
          ),
          ListTile(
            title: Text('Log Out'),
            leading: Icon(Icons.logout),
            onTap: (){

              Navigator.push(context, MaterialPageRoute(builder: (context)=>login()));
              Fluttertoast.showToast(msg: 'Log Out',toastLength: Toast.LENGTH_LONG);
            },
          ),



        ],
      ),
    );
  }
}
