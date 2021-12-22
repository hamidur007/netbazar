import 'package:flutter/material.dart';
import 'productlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Invoice extends StatefulWidget {
  final productlist proDetails;
  int orderNo;
  Invoice(this.proDetails, this.orderNo);

  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  String user_name = "";
  String userphone = "";
  @override
  void initState() {
    GetSharePref();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffdb98),
        title: Center(
          child: Text(
            'Invoice',
            style: TextStyle(color: Color(0xFF876555), fontSize: 28),
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: 16,
            ),
            Center(
              child: Text('Invoice No : 1000'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    //Text('Name : ${widget.proDetails.title}'),
                    Text('Name : ${user_name}',style: TextStyle(color: Color(0xFF876555), fontSize: 28),),
                    Text('Mobile : ${userphone}',style: TextStyle(color: Color(0xFF876555), fontSize: 28),),
                    Text('No of Product : ${widget.orderNo}',style: TextStyle(color: Color(0xFF876555), fontSize: 28),),
                    Text('Price : ${widget.proDetails.price}',style: TextStyle(color: Color(0xFF876555), fontSize: 28),),
                    Text(
                        'Total Price : ${widget.proDetails.price * widget.orderNo}',style: TextStyle(color: Color(0xFF876555), fontSize: 28),),
                    Text('NameAddress : 500',style: TextStyle(color: Color(0xFF876555), fontSize: 28),),
                  ],
                ),
              ),
            ),
            ListTile(
              leading: Image.network('${widget.proDetails.imageUrl}'),
              title: Text('${widget.proDetails.title}'),
            ),
          ],
        ),
      ),
    );
  }

  GetSharePref() async {
    final preff = await SharedPreferences.getInstance();
    setState(() {
      user_name = preff.getString("userName")!;
      userphone = preff.getString("user_phone")!;
    });
  }
}
