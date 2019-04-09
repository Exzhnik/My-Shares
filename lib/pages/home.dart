import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shares/setup/data_search.dart';
import 'package:my_shares/setup/shares.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user, this.title}) : super(key: key);
  final FirebaseUser user;
  final String title;

  static String tag = 'home';
  @override
  _HomeState createState() => _HomeState();
}

// const key = 'GGGY02OO6F2TGGOC';

class _HomeState extends State<Home> {
  List<Shares> stock = [];
  List<Shares> search = [];
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    stock.clear();

    final response =
        await http.get('https://api.iextrading.com/1.0/ref-data/symbols');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          stock.add(Shares.fromJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    stock.forEach((f) {
      if (f.name.contains(text) ||
          f.symbol.toString().contains(text.toUpperCase())) search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5C6DC0),
      appBar: AppBar(
        title: Center(child: Text('TEST')),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              color: Color(0xFF5C6DC0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.search),
                  title: TextField(
                    textCapitalization: TextCapitalization.words,
                    controller: controller,
                    onChanged: onSearch,
                    decoration: InputDecoration(
                        hintText: "Search", border: InputBorder.none),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      controller.clear();
                      onSearch('');
                    },
                    icon: Icon(Icons.cancel),
                  ),
                ),
              ),
            ),
            loading
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: search.length != 0 || controller.text.isNotEmpty
                        ? new ListTwo(search: search)
                        : ListView.builder(
                            itemCount: stock.length,
                            itemBuilder: (context, index) {
                              final sto = stock[index];
                              var networkImage = NetworkImage(
                                  'https://storage.googleapis.com/iex/api/logos/${sto.symbol}.png');
                              return Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  CircleAvatar(
                                    backgroundImage: networkImage,
                                    radius: 30,
                                  ),
                                  SizedBox(
                                    height: 2.0,
                                  ),
                                  Text(
                                    sto.name,
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ));
                            },
                          ),
                  )
          ],
        ),
      ),
    );
  }
}

class ListTwo extends StatelessWidget {
  const ListTwo({
    Key key,
    @required this.search,
  }) : super(key: key);

  final List<Shares> search;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: search.length,
      itemBuilder: (context, index) {
        final sto2 = search[index];
        var networkImage = NetworkImage(
            'https://storage.googleapis.com/iex/api/logos/${sto2.symbol}.png');
        return Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(
              backgroundImage: networkImage,
              radius: 30,
            ),
            SizedBox(
              height: 2.0,
            ),
            Text(
              sto2.name,
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ));
      },
    );
  }
}
