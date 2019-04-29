import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:my_shares/setup/previos.dart';

class MyApp extends StatelessWidget {
  String text;
  MyApp({this.text});
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new MyHomePage(text2: text),
    );
  }
}

class MyHomePage extends StatefulWidget {
  String text2;
  MyHomePage({this.text2});
  @override
  _MyHomePageState createState() => new _MyHomePageState(text3: text2);
}

class _MyHomePageState extends State<MyHomePage> {
  String text3;

  _MyHomePageState({this.text3});

  Previos _company;
  void _updateData() async {
    String url = 'https://api.iextrading.com/1.0/stock/$text3/quote';
    var res = await http.get(url, headers: {"Accept": "application/json"});
    if (res.statusCode == 200) {
      setState(() {
        _company = Previos.fromJson(json.decode(res.body));
      });
    } else {
      Center(
        child: CircularProgressIndicator(),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFEF9A9A), const Color(0xFF5C6DC0)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Center(
        child: Card(
          margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                  title: Text(
                    _company?.companyName?.toString() ?? '',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(_company?.sector?.toString() ?? '')),
              ListTile(
                title: Text(
                  'Latest Price',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(_company?.latestPrice?.toString() ?? ''),
              )
            ],
          ),
        ),
      ),
    );
  }
}
