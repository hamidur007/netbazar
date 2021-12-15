import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';
class splash extends StatefulWidget {


  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {

  void initState(){
    Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => login()));

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
                height: sc_height / 2,
                child: Image.network('http://4.bp.blogspot.com/-8dNjFZKYTuo/TeUCdMRy3lI/AAAAAAAABI0/wmTKQnnGUsk/s1600/Animated+flag+of+Bangladesh+flag+animation+gif'),
            ),
            SizedBox(
              height: sc_height / 12,
            ),
            Container(
              height: sc_height / 5,
              child: Center(
                child: Text(
                  "Net Bazar",
                  style: GoogleFonts.arbutus(
                      textStyle: TextStyle(
                          fontSize: width / 12,color: Color(0xFF876555)
                      )
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
