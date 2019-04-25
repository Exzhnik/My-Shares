import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_shares/pages/stocks.dart';
import 'package:my_shares/setup/shares.dart';
import 'package:my_shares/setup/previos.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user, this.title}) : super(key: key);
  final FirebaseUser user;
  final String title;

  static String tag = 'home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Shares> stock = [];
  List<Previos> sto = [];
  List<Shares> search = [];
  var loading = false;

  Future<Null> fetchData() async {
    setState(() {
      loading = true;
    });
    stock.clear();
    sto.clear();

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

  void navigateStock(String symbol) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5C6DC0),
      appBar: AppBar(
        title: Center(child: Text('${widget.user.email}')),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color(0xFFEF9A9A), const Color(0xFF5C6DC0)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
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

                              var stockRes = stock[index].symbol;
                              return Container(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MyApp(text: sto.symbol)));
                                    },
                                    child: Card(
                                      color: Colors.black,
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5.0, horizontal: 3.0),
                                          ),
                                          Flexible(
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 5.0,
                                                  horizontal: 3.0),
                                              child: Text(
                                                sto.name,
                                                overflow: TextOverflow.ellipsis,
                                                softWrap: true,
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
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
        return Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 2.0,
            ),
            GestureDetector(
              onTap: () {
                value:
                sto2.isEnabled;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyApp(
                              text: sto2.symbol,
                            )));
              },
              child: Card(
                color: Colors.black,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 3.0),
                    ),
                    Flexible(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 3.0),
                        child: Text(
                          sto2.name,
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
      },
    );
  }
}
