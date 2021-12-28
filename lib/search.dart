import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class search extends StatefulWidget {
  const search({Key? key}) : super(key: key);

  @override
  _searchState createState() => _searchState();
}
var row =[];
List result =[];
String query = '';
TextEditingController searchTC = TextEditingController();
class _searchState extends State<search> {
  
  @override
  void initState() {

    row = [
      {
        'name' : 'Product one',
        'price': 100,
        'des' : 'this is a best product ever'
      },
      {
        'name' : 'Product two',
        'price': 200,
        'des' : 'this is a best product ever'
      },
      {
        'name' : 'Product three',
        'price': 300,
        'des' : 'this is a best product ever'
      },
      {
        'name' : 'Product four',
        'price': 400,
        'des' : 'this is a best product ever'
      },

    ];
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
actions: [
  Container(
    height:20,
        width: MediaQuery.of(context).size.width,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
      controller: searchTC,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Search...'
        ),
        onChanged: (v){
        setState(() {
          query= v;
          setresult(query);

        });
        },
      ),
    ),
    )

],
      ),
      body: Stack(
        children: [
          Column(
        children: [
          Container(
        child: query.isEmpty
            ?
            ListView.builder(
              shrinkWrap: true,
                itemCount: row.length,
                itemBuilder: (_,i){
                return Card(
                  child: ListTile(
                    title: Text(row[i]['name']),
                    onTap: () {
                      setState(() {
                        searchTC.text = row[i]['name'];
                        query = row[i] ['name'];
                        setresult(query);
                      });
                    })
                      );
                    },
                  ):
        ListView.builder(
          shrinkWrap: true,
          itemCount: result.length,
          itemBuilder: (_,i){
            return Card(
                child: ListTile(
                    title: Text(result[i]['name']),
                    onTap: () {
                      SetState() {
                        searchTC.text = result[i]['name'];
                        query = row[i] ['name'];
                        setresult(query);
                      }
                    })
            );
          },
        )

                )

    ],
    )
    ]
    )
    );

  }

  void setresult(String query) {
    result=row.where((element) =>
    element['name'].toString().toLowerCase().contains(query.toLowerCase())||
        element['name'].toString().toLowerCase().contains(query.toLowerCase())).toList();
  }

}
