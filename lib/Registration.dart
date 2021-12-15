import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';
class Registration extends StatefulWidget {

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController UserNameController = TextEditingController();

  TextEditingController AreaZipcodeController = TextEditingController();

  TextEditingController UserEmailController = TextEditingController();

  TextEditingController MobileNumberController = TextEditingController();

  TextEditingController DateofbirthController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFffdb98),
      appBar: AppBar(
        backgroundColor: Color(0xFFffdb98),
        title: Center(child: Text("Registration Page",
          style: TextStyle(color: Color(0xFF876555),fontSize: 28),)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 48,
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: UserNameController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter your User Name'),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: UserEmailController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'User Email',
                      hintText: 'Enter your Email'),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: MobileNumberController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'User Mobile Number',
                      hintText: 'Enter your Mobile Number'),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter your Password'),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: DateofbirthController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Date of birth',
                      hintText: 'Enter your Date of birth'),
                ),
              ),
              Padding(
                padding:const EdgeInsets.all(8.0),
                child: TextField(
                  controller: AreaZipcodeController,
                  decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(),
                      labelText: 'Area Zip Code',
                      hintText: 'Enter your Area Zip Code'),
                ),
              ),
              Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(onPressed: () {
                  //setSharedPreference();
                  setuser_name();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
                },
                  child: Text('Submit',style: GoogleFonts.aBeeZee(color: Color(
                      0xFF876555)),),

              ),
                ),


          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Text(
                  'Have an accont Login',
                  style: GoogleFonts.aBeeZee(color: Color(0xFF7F14C1)),

                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }


  Future<void> setuser_name() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("user_Email", UserEmailController.text);
    prefs.setString('user_password', passwordController.text);

  }
}
