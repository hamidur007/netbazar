import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_carousel_slider/carousel_slider_indicators.dart';
import 'package:flutter_carousel_slider/carousel_slider_transforms.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:netbazar/mainDrawer.dart';
import 'package:netbazar/productData.dart';
import 'package:netbazar/productlist.dart';
import 'package:netbazar/productview.dart';

class home extends StatefulWidget {
  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  int _selectNavPosition = 1;

  final List<String> imagelist = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ_wGEdj4gNipiMldcwXPH1_VHI52gpTpNwZQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLFWxHuUkaeCR3TPBXv15tiwk1CylmAQVSDQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLaE6D66WBUhJn6Uq6wLrYjxVsYe1Wbu6AqA&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThPBQYmjl1GVGdhWIWdehY3WXYsQcD6mLY_A&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZVozcpqUa6yfQWcM8joMCUcyB1eEZ8mn4_w&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJcbl2cmQcU7y6WabygXSJJjoIzTzBHerFAA&usqp=CAU",
  ];

/*all product list*/
  /*final List<productlist> productslist = [
    productlist(1, "Mobile 1", "Cadets from Bangladesh, Palestine and Sri Lanka have been commissioned following three years of rigorous training of the 81st BMA Regular Commission (Long Course)", 10, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLFWxHuUkaeCR3TPBXv15tiwk1CylmAQVSDQ&usqp=CAU'),
    productlist(2, "product 2", "Product 2 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLaE6D66WBUhJn6Uq6wLrYjxVsYe1Wbu6AqA&usqp=CAU'),
    productlist(3, "product 3", "Product 3 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTM-qI3CJCzaBoAgHpCWTvfMJnJPBsKiVfkhQ&usqp=CAU'),
    productlist(4, "product 4", "Product 4 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThPBQYmjl1GVGdhWIWdehY3WXYsQcD6mLY_A&usqp=CAU'),
    productlist(5, "product 5", "Product 5 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhPT6OIAYZRbEYuQdKZUkPHmtdb_aXfHnvgg&usqp=CAU'),
    productlist(6, "product 6", "Product 6 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZVozcpqUa6yfQWcM8joMCUcyB1eEZ8mn4_w&usqp=CAU'),
    productlist(7, "product 7", "Product 7 desc", 5, 2, 20, 100, 5, 'https://image.shutterstock.com/display_pic_with_logo/297429986/2016734513/stock-vector-mens-and-boys-wear-three-piece-suit-2016734513.jpg'),
    productlist(8, "product 8", "Product 8 desc", 5, 2, 20, 100, 5, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJcbl2cmQcU7y6WabygXSJJjoIzTzBHerFAA&usqp=CAU'),
  ];*/

  var pdata = new productData();

  @override
  Widget build(BuildContext context) {
    int stock = 5;
    var onstock = "On Stock";
    var SoldOut = "Out of Stock";
    return Scaffold(
      backgroundColor: Color(0xFFffdb98),
      drawer: mainDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFFffdb98),
        iconTheme: IconThemeData(color: Color(0xFF876555)),
        title: Center(
            child: Text(
          'Home',
          style: TextStyle(color: Color(0xFF876555), fontSize: 28),
        )),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 150,
              child: CarouselSlider.builder(
                slideBuilder: (index) {
                  return Container(
                    child: Image.network(
                      imagelist[index],
                      fit: BoxFit.fill,
                    ),
                  );
                },
                slideTransform: CubeTransform(),
                slideIndicator:
                    CircularSlideIndicator(padding: EdgeInsets.only(bottom: 8)),
                autoSliderDelay: Duration(seconds: 5),
                enableAutoSlider: true,
                unlimitedMode: true,
                itemCount: imagelist.length,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  itemCount: pdata.productslist.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 2,
                    childAspectRatio: .55,
                    crossAxisSpacing: 2,
                  ),
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    productview(pdata.productslist[index])));
                      },
                      child: Stack(
                        overflow: Overflow.visible,
                        alignment: Alignment.topLeft,
                        children: [
                          Card(
                            elevation: 10,
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Container(
                                    height:
                                        MediaQuery.of(context).size.height / 4,
                                    child: Image.network(
                                      pdata.productslist[index].imageUrl,
                                      fit: BoxFit.fill,
                                      height: 65,
                                    ),
                                  ),
                                ),
                                Text(pdata.productslist[index].title),
                                Text(
                                    "Price: ${pdata.productslist[index].price.toString()}"),
                                Container(
                                  width: 180,
                                  height: 50,
                                  child: Center(
                                    child: Column(
                                      children: [
                                        Text("Review"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                                onTap: () {},
                                                child: Icon(Icons.star)),
                                            InkWell(
                                                onTap: () {},
                                                child: Icon(Icons.star)),
                                            InkWell(
                                                onTap: () {},
                                                child: Icon(Icons.star)),
                                            InkWell(
                                                onTap: () {},
                                                child: Icon(Icons.star)),
                                            InkWell(
                                              onTap: () {},
                                              child: Icon(Icons.star),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 5,
                            left: 5,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.deepOrange,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 3),
                                  child: Text("On Stock"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
      /*bottomNavigationBar: FancyBottomNavigation(
          barBackgroundColor: Color(0xFFffdb98),

          tabs: [

            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.add_alert_sharp, title: "Notification"),
            TabData(iconData: Icons.shopping_cart, title: "Product"),
            TabData(iconData: Icons.account_box, title: "Account"),
          ],

           inactiveIconColor: Color(0xFF876555),
           circleColor: Color(0xFF876555),
          onTabChangedListener: (position) {
            setState(() {
              */ /*currentPage = position;*/ /*
            });
          },
        ),*/

      /*bottomNavigationBar: BottomNavigationBar(
       items: [

         BottomNavigationBarItem(
           label: 'Home',icon: Icon(Icons.home)),
      BottomNavigationBarItem(
          label: 'Product 2',icon: Icon(Icons.date_range)),
         BottomNavigationBarItem(
             label: 'Notification',icon: Icon(Icons.add_alert_sharp)),
         BottomNavigationBarItem(
             label: 'Profile',icon: Icon(Icons.account_box)),

       ],
        backgroundColor: Color(0xFFffdb98),
        selectedItemColor: Colors.purple,
        unselectedItemColor: Color(0xFF876555),
        elevation: 20,
        currentIndex: _selectNavPosition,
        onTap: (int index){
         setState(() {
           _selectNavPosition = index;
         });
        // Fluttertoast.showToast(msg: index.toString(), toastLength: Toast.LENGTH_LONG);
        },
      ),*/
    );
  }
}
