import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login.dart';

class Forgetpassword extends StatefulWidget {

  @override
  _ForgetpasswordState createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {

  TextEditingController userEmailController = TextEditingController();

  TextEditingController userNewpasswordController = TextEditingController();

  TextEditingController userConfirmpasswordController = TextEditingController();

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
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFffdb98),
        appBar: AppBar(
          backgroundColor: Color(0xFFffdb98),
          title: Text("Password Reset",
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 48,
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userEmailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Type User Email',
                      hintText: 'Enter your User Email'),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userNewpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'New password',
                      hintText: 'Enter your New password'),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: userConfirmpasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Confirm password',
                      hintText: 'Confirm your password'),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFF7F14C1FF),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(onPressed: () {
                  if (userEmail == userEmailController.text) {
                    if (userNewpasswordController.text ==
                        userConfirmpasswordController.text ) {
                      setSharedPreferance();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => login()));
                    } else {
                      Fluttertoast.showToast(
                          msg: 'Please enter a valid pass',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.SNACKBAR,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    };
                  } else {
                    Fluttertoast.showToast(
                        msg: 'Please enter a valid Email',
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.SNACKBAR,
                        timeInSecForIosWeb: 1,
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0);
                  }
                },

                  child: Text('Submit',style: GoogleFonts.aBeeZee(color: Color(
                      0xFF7F14C1)))
                ),
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
      userEmail = prefs.getString("user_Email") !;
    });
    //return user_name;
  }
  setSharedPreferance() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_password', userNewpasswordController.text);
  }
}
