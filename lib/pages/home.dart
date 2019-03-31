import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shares/setup/data_search.dart';
import 'package:my_shares/setup/response/sharesList.dart';
import 'package:my_shares/setup/shares.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user, this.title}) : super(key: key);
  final FirebaseUser user;
  final String title;

  static String tag = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Shares> share = [];

  Future loadSharesList() async {
    http.Response responese = await http.get(
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo');
    String content = responese.body;
    List collection = json.decode(content);
    List<Shares> _share =
        collection.map((json) => Shares.fromJson(json)).toList();

    setState(() {
      share = _share;
    });

    void initState() {
      loadSharesList();
      super.initState();
    }
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
      body: ListView.separated(
        itemCount: share.length,
        separatorBuilder: (context, index) => Divider(),
        itemBuilder: (context, index) {
          var shar = share[index];
          return ListTile(
            title: Text(shar.s2Name),
            isThreeLine: true,
            leading: CircleAvatar(
              child: Text(shar.s4Region),
            ),
          );
        },
      ),
    );
  }
}
