import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netbazar/Invoice.dart';
import 'package:netbazar/productlist.dart';
import 'Invoice.dart';

class productview extends StatefulWidget {
  final productlist proDetails;
  productview(this.proDetails);

  @override
  _productviewState createState() => _productviewState();
  }

class _productviewState extends State<productview> {

  int count = 0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFffdb98),
       title: Center(child: Text("${widget.proDetails.title}",
         style: TextStyle(color: Color(0xFF876555),fontSize: 28),)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            
            flex: 8,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(
                        child: Image.network(widget.proDetails.imageUrl,fit: BoxFit.fill,)
                    ),
                  ),

                  Flexible(
                      flex: 3,
                      child: Column(
                        children: [
                          Card(
                              elevation: 10,
                              child: Container(
                                  width: 180,
                                  height: 50,
                                  child: Center(child: Column(
                                    children: [
                                      Text("Review"),
                                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),
                                          Icon(Icons.star),

                                        ],
                                      ),
                                    ],
                                  )))),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Card(
                                    elevation: 10,
                                    child: Container(
                                        width: 100,
                                        height: 30,
                                        child: Center(child: Text("Product ID: ${widget.proDetails.id}")))),
                                Card(
                                  elevation: 10,
                                  child: Container(
                                      width: 100,
                                      height: 30,
                                      child: Center(child: Text("Price: \$ ${widget.proDetails.price}"))),
                                ),
                                Card(
                                  elevation: 10,
                                  child: Container(
                                      width: 100,
                                      height: 30,
                                      child: Center(child: Text("Discount : ${widget.proDetails.discount} %"))),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Card(
                                  elevation: 10,
                                  child: Container(
                                      height: 30,
                                      width: 100,
                                      child: Center(child: Text("Description "))),
                                ),
                              ],
                            ),
                          ),
                          Text(widget.proDetails.desc, maxLines: 2,),
                        ],
                      )
                  ),
                ],
              ),
              ),
            ),),


          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 1,color: Colors.black),
                  ),
                  height: MediaQuery.of(context).size.height/10,
                  child: Row(
                    children: [
                      Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                            Center(
                            child: TextButton(onPressed: (){
                              setState(() {
                               if(count>0){count--;}else{count;};
                            });},
                              child: Text("-",style: TextStyle(color: Colors.black,fontSize:19))),
              ),
                              VerticalDivider(thickness: 2,),
                              Center(child: Text("$count")),
                              VerticalDivider(thickness: 1,),
                              Center(child:
                              TextButton(onPressed: (){
                                setState(() {
                                  if(count<10){count++;}else{count;};
                                });
                              },
                                child: Text("+",style: TextStyle(color: Colors.black,fontSize:20)),)),
                            ],
                          ),
                      ),
                      Flexible(
                        flex: 1,
                          child: Container(
                            color: Colors.indigo,
                            child: Center(child: TextButton(onPressed: (){

                              Navigator.push(context, MaterialPageRoute(builder: (context) => Invoice(widget.proDetails,count,)));

                            },
                              child: Text('Add to Cart',style: TextStyle(color: Colors.white,fontSize: 20)),),),
                          )
                      )
                    ],
                  ),
                ),

              ),
          ),
        ],
      )
    );
  }
}
