import 'package:flutter/material.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffdb98),
        title: Text("Notification",style: TextStyle(color: Color(0xFF876555), fontSize: 28),
      ),),
      body: SafeArea(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}

