

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netbazar/mainDrawer.dart';

class Deshboard extends StatelessWidget {
  const Deshboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;

    return MaterialApp(
      home: Scaffold(
        drawer: mainDrawer(),
        appBar: AppBar(
          title: Text("Dashboard"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 20,
                        child: Container(
                          width: MediaQuery.of(context).size.width/3.5,
                          height: h/3,
                          child: Column(
                            children: [
                              Container(
                                height: 150,
                                child: Image.asset("lib/image/bkash.png"),
                              ),
                              Text("Mobile"),
                            ],
                          ),
                        ),
                      ),
                    ]),

              ]),
        ),
      ),
    );
  }
}
