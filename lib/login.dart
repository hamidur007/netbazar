import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netbazar/productview.dart';
import 'package:netbazar/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Forgetpassword.dart';
import 'Registration.dart';
import 'counter.dart';
import 'home.dart';
import 'main.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController userEmailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  String userEmail = "";

  String pass = "";

  @override
  void initState() {
    // TODO: implement initState
    this.userEmail = userEmail;
    this.pass = pass;
    getString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffdb98),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                height: 100,
                child: Image.asset("images/cart.png"),
                /*child: Image.network('http://4.bp.blogspot.com/-8dNjFZKYTuo/TeUCdMRy3lI/AAAAAAAABI0/wmTKQnnGUsk/s1600/Animated+flag+of+Bangladesh+flag+animation+gif'),*/
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Center(
                  child: Text(
                    "Net Bazar",
                    style: GoogleFonts.arbutus(
                      textStyle: TextStyle(
                        fontSize: 48,
                        color: Color(0xFF876555),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 48,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'User Email',
                    hintText: 'Enter your Email',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Forgetpassword()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Text(
                      'Forgot password',
                      style: GoogleFonts.aBeeZee(
                          color: Color(0xFF7F14C1), fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () {
                      if (userEmailController.text.isEmpty &&
                          passwordController.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: 'please give your ID and pass',
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.SNACKBAR,
                            backgroundColor: Colors.deepOrange);
                      } else if (userEmail == userEmailController.text &&
                          pass == passwordController.text) {
                        Fluttertoast.showToast(
                            msg: 'Login Successful',
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.deepOrange);

                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyHome()));
                      } else {
                        Fluttertoast.showToast(
                            msg: 'please try with valid password',
                            toastLength: Toast.LENGTH_LONG,
                            backgroundColor: Colors.deepOrange);
                      }
                    },
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.aBeeZee(
                          color: Color(0xFF876555),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Registration()));
                    },
                    child: Text(
                      'Registration',
                      style: GoogleFonts.aBeeZee(
                          color: Color(0xFF876555),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    )),
              ),
              SizedBox(
                height: 16,
              ),
              /*Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => profile()));

                },
                  child: Text('Profile',style: GoogleFonts.aBeeZee(color: Color(
                      0xFF7F14C1)),),


                ),
              ),*/
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  getString() async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      userEmail = prefs.getString("user_Email") ?? "null";
      pass = prefs.getString("user_password") ?? "null";
    });
    //return user_name;
  }
}
