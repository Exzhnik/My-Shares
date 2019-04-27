import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Stock {
  var  symbol;
  var  companyName;
  var  primaryExchange;
  var  sector;
  var  calculationPrice;
  var  open;
  var openTime;
  var  close;
  var closeTime;
  var  high;
  var  low;
  var  latestPrice;
  var  latestSource;
  var  latestTime;
  var latestUpdate;
  var latestVolume;
  var  iexRealtimePrice;
  var iexRealtimeSize;
  var iexLastUpdated;
  var  delayedPrice;
  var delayedPriceTime;
  var  extendedPrice;
  var extendedChange;
  var  extendedChangePercent;
  var extendedPriceTime;
  var  previousClose;
  var  change;
  var  changePercent;
  var  iexMarketPercent;
  var iexVolume;
  var avgTotalVolume;
  var iexBidPrice;
  var iexBidSize;
  var  iexAskPrice;
  var iexAskSize;
  var marketCap;
  var  peRatio;
  var  week52High;
  var  week52Low;
  var  ytdChange;

  Stock(
      {
     
      this.symbol,
      this.companyName,
      this.primaryExchange,
      this.sector,
      this.calculationPrice,
      this.open,
      this.openTime,
      this.close,
      this.closeTime,
      this.high,
      this.low,
      this.latestPrice,
      this.latestSource,
      this.latestTime,
      this.latestUpdate,
      this.latestVolume,
      this.iexRealtimePrice,
      this.iexRealtimeSize,
      this.iexLastUpdated,
      this.delayedPrice,
      this.delayedPriceTime,
      this.extendedPrice,
      this.extendedChange,
      this.extendedChangePercent,
      this.extendedPriceTime,
      this.previousClose,
      this.change,
      this.changePercent,
      this.iexMarketPercent,
      this.iexVolume,
      this.avgTotalVolume,
      this.iexBidPrice,
      this.iexBidSize,
      this.iexAskPrice,
      this.iexAskSize,
      this.marketCap,
      this.peRatio,
      this.week52High,
      this.week52Low,
      this.ytdChange});

  factory Stock.fromJson(Map<String, dynamic> json) {
    return Stock(
      symbol: json['symbol'] ,
      companyName: json['companyName'] ,
      primaryExchange: json['primaryExchange'] ,
      sector: json['sector'] ,
      calculationPrice: json['calculationPrice'] ,
      open: json['open'] ,
      openTime: json['openTime'] ,
      close: json['close'] ,
      closeTime: json['closeTime'] ,
      high: json['high'] ,
      low: json['low'] ,
      latestPrice: json['latestPrice'] ,
      latestSource: json['latestSource'] ,
      latestTime: json['latestTime'] ,
      latestUpdate: json['latestUpdate'] ,
      latestVolume: json['latestVolume'] ,
      iexRealtimePrice: json['iexRealtimePrice'] ,
      iexRealtimeSize: json['iexRealtimeSize'] ,
      iexLastUpdated: json['iexLastUpdated'] ,
      delayedPrice: json['delayedPrice'] ,
      delayedPriceTime: json['delayedPriceTime'] ,
      extendedPrice: json['extendedPrice'] ,
      extendedChange: json['extendedChange'] ,
      extendedChangePercent: json['extendedChangePercent'] ,
      extendedPriceTime: json['extendedPriceTime'] ,
      previousClose: json['previousClose'] ,
      change: json['change'] ,
      changePercent: json['changePercent'] ,
      iexMarketPercent: json['iexMarketPercent'] ,
      iexVolume: json['iexVolume'] ,
      avgTotalVolume: json['avgTotalVolume'] ,
      iexBidPrice: json['iexBidPrice'] ,
      iexBidSize: json['iexBidSize'] ,
      iexAskPrice: json['iexAskPrice'] ,
      iexAskSize: json['iexAskSize'] ,
      marketCap: json['marketCap'] ,
      peRatio: json['peRatio'] ,
      week52High: json['week52High'] ,
      week52Low: json['week52Low'] ,
      ytdChange: json['ytdChange'] ,
     
    );
  }
}

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
//   void _updateData() {
//   http.get('https://api.iextrading.com/1.0/stock/$text3/quote')
//     .then(_processResponse);
// }

// void _processResponse(http.Response response) {
//   if (response.statusCode == 200) {
//     setState(() {
//       _user = Stock.fromJson(json.decode(response.body));
//     });
//   }
// }
  Stock _user;
  void _updateData() async {
    String url = 'https://api.iextrading.com/1.0/stock/$text3/quote';
    var res = await http.get(url, headers: {"Accept": "application/json"});
    // var data = json.decode(res.body);
    if (res.statusCode == 200) {
      setState(() {
        _user = Stock.fromJson(json.decode(res.body));
      });
    } else {
      Center(
        child: CircularProgressIndicator(),
      );
    }
    ;
  }


  @override
  void initState() {
    super.initState();
    _updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('test'),
      ),
      body: Container(
        child: Text(_user?.companyName?.toString() ?? '',),
      ),
    );
  }
}
// Text(
//           _user?.symbol?.toString() ?? '',
