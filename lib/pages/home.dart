import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shares/setup/data_search.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user, this.title}) : super(key: key);
  final FirebaseUser user;
  final String title;

  static String tag = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String url =
      'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=AMD&apikey=GGGY02OO6F2TGGOC';
  List data;
  Future<String> makeRequest() async {
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    setState(() {
      var extractdata = json.decode(response.body);
      data = extractdata["bestMatches"];
    });
  }

  @override
  void initState() {
    this.makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF5C6DC0),
        appBar: AppBar(
          title: Center(child: Text('${widget.user.email}')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: SearchData());
              },
            )
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFEF9A9A), const Color(0xFF5C6DC0)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
          child: new ListView.builder(
              itemCount: data == null ? 0 : data.length,
              itemBuilder: (BuildContext context, i) {
                return new ListTile(
                  title: new Text(data[i]["2. name"]),
                );
              }),
        ));
  }
}
// String url ='https://randomuser.me/api/?results=15';
// List data;
// Future<String> makeRequest() async{
//   var response = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

//   setState(() {
//    var extra = JsonDecoder().convert(response.body);
//    data = extra["results"];
//   });

//   @override
//   void initState(){
//     this.makeRequest();
//   }
// }
// List<Shares> list =List();
// var  isLoading = false;
// List<Shares> share = [];
// String url ='https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo';

// Future<String> loadSharesList() async {
//   http.Response responese = await http.get(
//       'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo');
//   String content = responese.body;
//   List collection = json.decode(content);
//   List<Shares> _share =
//       collection.map((json) => Shares.fromJson(json)).toList();

//   setState(() {
//     share = _share;
//   });

//   void initState() {
//     loadSharesList();
//     super.initState();
//   }
// }
// _fetchData() async{
//   setState(() {
//    isLoading = true;
//   });
//   final response= await http.get('https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo');
//   if (response.statusCode == 200){
//     list = (json.decode(response.body) as List).map((data)=> Shares.fromJson(data)).toList();
//     setState(() {
//      isLoading = false;
//     });
//   } else{
//     throw Exception('Faled');
//   }
// }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     backgroundColor: Colors.white,
//     appBar: AppBar(
//       title: Center(child: Text('${widget.user.email}')),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.search),
//           onPressed: () {
//             showSearch(context: context, delegate: SearchData());
//           },
//         )
//       ],
//     ),
//     body: ListView.builder(
//       itemCount:data==null ? 0 : data.length,
//       itemBuilder: (context, index){
//         return ListTile(
//           contentPadding: EdgeInsets.all(10.0),
//           title: Text(data[index]["name"]),
//         );
//       },
//     )
//   );
// }
