import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState() {
    Timer(Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final sc_height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFffdb98),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              child: Image.asset("images/cart.png"),
              /*child: Image.network('http://4.bp.blogspot.com/-8dNjFZKYTuo/TeUCdMRy3lI/AAAAAAAABI0/wmTKQnnGUsk/s1600/Animated+flag+of+Bangladesh+flag+animation+gif'),*/
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              //height: sc_height / 5,
              child: Center(
                child: Text(
                  "Net Bazar",
                  style: GoogleFonts.arbutus(
                    textStyle: TextStyle(
                      fontSize: width / 8,
                      color: Color(0xFF876555),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
