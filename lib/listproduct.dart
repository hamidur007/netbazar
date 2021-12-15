import 'package:flutter/material.dart';
import 'package:netbazar/productData.dart';
import 'package:netbazar/productlist.dart';
import 'package:netbazar/productview.dart';

class listproduct extends StatelessWidget {
  /* final List<productlist> productslist = [
    productlist(1, "Mobile 1", "Cadets from Bangladesh, Palestine and Sri Lanka have been commissioned following three years of rigorous training of the 81st BMA Regular Commission (Long Course)", 10, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLFWxHuUkaeCR3TPBXv15tiwk1CylmAQVSDQ&usqp=CAU'),
    productlist(2, "product 2", "Product 2 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLaE6D66WBUhJn6Uq6wLrYjxVsYe1Wbu6AqA&usqp=CAU'),
    productlist(3, "product 3", "Product 3 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM-qI3CJCzaBoAgHpCWTvfMJnJPBsKiVfkhQ&usqp=CAU'),
    productlist(4, "product 4", "Product 4 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThPBQYmjl1GVGdhWIWdehY3WXYsQcD6mLY_A&usqp=CAU'),
    productlist(5, "product 5", "Product 5 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhPT6OIAYZRbEYuQdKZUkPHmtdb_aXfHnvgg&usqp=CAU'),
    productlist(6, "product 6", "Product 6 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZVozcpqUa6yfQWcM8joMCUcyB1eEZ8mn4_w&usqp=CAU'),
    productlist(7, "product 7", "Product 7 desc", 5, 2, 20, 100, 5, 'https://image.shutterstock.com/display_pic_with_logo/297429986/2016734513/stock-vector-mens-and-boys-wear-three-piece-suit-2016734513.jpg'),
    productlist(8, "product 8", "Product 8 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJcbl2cmQcU7y6WabygXSJJjoIzTzBHerFAA&usqp=CAU'),
  ];*/

  var prolist = new productData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Menus'),
        ),
        body:
        ListView.builder(
          itemCount: prolist.productslist.length,
            itemBuilder: (context, i){
          return InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> productview(prolist.productslist[i])));
            },
           child: Card(
            child: ListTile(
              title: Text('${prolist.productslist[i].title}'),
              leading: Image.network('${prolist.productslist[i].imageUrl}'),
              trailing: Icon(Icons.login),
            ),
          ),
              );
        }
        ),
    );
  }
}
