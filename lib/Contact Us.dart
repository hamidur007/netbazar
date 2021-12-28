import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactUs extends StatelessWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffdb98),
        title: Center(
            child: Text(
          "Contact Us",
          style: TextStyle(color: Color(0xFF876555), fontSize: 28),
        )),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Center(
                  child: Text(
                    "Net Bazar",
                    style: GoogleFonts.arbutus(
                      textStyle:
                          TextStyle(fontSize: 48, color: Color(0xFF876555)),
                    ),
                  ),
                ),
              ),



              Text('M.M Hamidur Rahman',style: TextStyle(fontSize: 18, color: Colors.pink),),
              Text('Mobile Apps & Games Development Cours Sherpur 2021',style: TextStyle(fontSize: 15, color: Colors.green),),
              Text('Bath No:- 77',style: TextStyle(fontSize: 15, color: Colors.green),),
              Text('Roll No:- 09',style: TextStyle(fontSize: 15, color: Colors.green),),
          SizedBox(
            height: 16,
          ),
              Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Address',style: TextStyle(fontSize: 20, color: Colors.pink),),

                      ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Hotline',style: TextStyle(fontSize: 20, color: Colors.pink),),
                    ),

                     ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Bagraksha sherpur town\nsherpur',style: TextStyle(fontSize: 16, color: Colors.green),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('01911938620\n01770033442',style: TextStyle(fontSize: 16, color: Colors.green),),
                  ),
                ],
              ),
              ListTile(
                title: Text('hamid7927@gmail.com',style: TextStyle(fontSize: 16, color: Colors.purple),),
                leading: Icon(Icons.mail),
                onTap: () {},
              ),

             /* ListTile(
                title: Text(
                  'Hotline Number: 01770033442',
                  style: TextStyle(fontSize: 18, color: Colors.purple),
                ),
              ),
              ListTile(
                title: Text(
                  'Email: hamid7927@gmail.com',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ),
              ListTile(
                title: Text(
                  'Web: Under Construction',
                  style: TextStyle(fontSize: 20, color: Colors.purple),
                ),
              ),

              Text('Web: Under Construction'),
              ListTile(
                title: Card(
                  child: Container(
                    height: 30,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Follow Us',
                        style: TextStyle(fontSize: 26, color: Colors.green),
                      ),
                    ),
                  ),
                  elevation: 10,
                ),
              ),
              ListTile(
                title: Container(
                  height: 40,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Facebook',
                      style: TextStyle(fontSize: 26, color: Colors.yellow),
                    ),
                  ),
                ),
              ),*/
            ],
          ),

        ),
      ),
    );
  }
}
