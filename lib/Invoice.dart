import 'package:flutter/material.dart';
import 'productlist.dart';


class Invoice extends StatelessWidget {
  final productlist proDetails;
  int orderNo;
  Invoice(this.proDetails, this.orderNo);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Center(child: Text('Invoice No : 1000'),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Text('Name : 500'),
                    Text('Mobile : 500'),
                    Text('NameAddress : 500'),
                  ],
                ),

              ),
            ),
            ListTile(
              leading: Image.network('${proDetails.imageUrl}'),
              title: Text('${proDetails.title}'),
            )
          ],
        ),
      ),
    );
  }
}
