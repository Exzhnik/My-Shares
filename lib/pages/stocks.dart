import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_candlesticks/flutter_candlesticks.dart';

import 'package:my_shares/setup/previos.dart';

// List sampleData = [
//   {"open": 50.0, "high": 100.0, "low": 40.0, "close": 80, "volumeto": 5000.0},
//   {"open": 80.0, "high": 90.0, "low": 55.0, "close": 65, "volumeto": 4000.0},
//   {"open": 65.0, "high": 120.0, "low": 60.0, "close": 90, "volumeto": 7000.0},
//   {"open": 90.0, "high": 95.0, "low": 85.0, "close": 80, "volumeto": 2000.0},
//   {"open": 80.0, "high": 85.0, "low": 40.0, "close": 50, "volumeto": 3000.0},
// ];

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
      height: 500.0,
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
              // OHLCVGraph(
    //               data: sampleData,
    // enableGridLines: true,
    // volumeProp: 0.1,
    // gridLineAmount: 5,
    // gridLineColor: Colors.grey[300],
    // gridLineLabelColor: Colors.grey),
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
