import 'dart:io';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class User {
  // final String symbol;
  // final String date;
  
  // final double open;
  // final double high;
  // final double low;
  // final double close;
  // final int volume;
  // final int unadjustedVolume;
  // final double change;
  // final double changePercent;
  // final double vwap;
  final String symbol;
 final String companyName;
 final String primaryExchange;
 final String sector;
 final String calculationPrice;
 final double open;
 final int openTime;
 final double close;
 final int closeTime;
 final double high;
 final double low;
 final double latestPrice;
 final String latestSource;
 final String latestTime;
 final int latestUpdate;
 final int latestVolume;
 final double iexRealtimePrice;
 final int iexRealtimeSize;
 final int iexLastUpdated;
 final double delayedPrice;
 final int delayedPriceTime;
 final double extendedPrice;
 final int extendedChange;
 final int extendedChangePercent;
 final int extendedPriceTime;
 final double previousClose;
 final double change;
 final double changePercent;
 final double iexMarketPercent;
 final int iexVolume;
 final int avgTotalVolume;
 final int iexBidPrice;
 final int iexBidSize;
 final double iexAskPrice;
 final int iexAskSize;
 final int marketCap;
 final double peRatio;
 final double week52High;
 final int week52Low;
 final double ytdChange;

  User({
    // this.symbol,
    //   this.date,
      
    //   this.open,
    //   this.high,
    //   this.low,
    //   this.close,
    //   this.volume,
    //   this.unadjustedVolume,
    //   this.change,
    //   this.changePercent,
    //   this.vwap
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
      this.ytdChange
      });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      symbol: json['symbol'] as String,
      companyName: json['companyName'] as String,
      primaryExchange: json['primaryExchange'] as String,
      sector: json['sector'] as String,
      calculationPrice: json['calculationPrice'] as String,
      open: json['open'] as double,
      openTime: json['openTime'] as int,
      close: json['close'] as double,
      closeTime: json['closeTime'],
      high: json['high'],
      low: json['low'],
      latestPrice: json['latestPrice'],
      latestSource: json['latestSource'],
      latestTime: json['latestTime'],
      latestUpdate: json['latestUpdate'],
      latestVolume: json['latestVolume'],
      iexRealtimePrice: json['iexRealtimePrice'],
      iexRealtimeSize: json['iexRealtimeSize'],
      iexLastUpdated: json['iexLastUpdated'],
      delayedPrice: json['delayedPrice'],
      delayedPriceTime: json['delayedPriceTime'],
      extendedPrice: json['extendedPrice'],
      extendedChange: json['extendedChange'],
      extendedChangePercent: json['extendedChangePercent'],
      extendedPriceTime: json['extendedPriceTime'],
      previousClose: json['previousClose'],
      change: json['change'],
      changePercent: json['changePercent'],
      iexMarketPercent: json['iexMarketPercent'],
      iexVolume: json['iexVolume'],
      avgTotalVolume: json['avgTotalVolume'],
      iexBidPrice: json['iexBidPrice'],
      iexBidSize: json['iexBidSize'],
      iexAskPrice: json['iexAskPrice'],
      iexAskSize: json['iexAskSize'],
      marketCap: json['marketCap'],
      peRatio: json['peRatio'],
      week52High: json['week52High'],
      week52Low: json['week52Low'],
      ytdChange: json['ytdChange'],
      // symbol: json['symbol'] as String,
      // date: json['date'] as String,
      // open: json['open'] as double,
      // high: json['hing'] as double,
      // low: json['low'] as double,
      // close: json['close'] as double,
      // volume: json['volume'] as int,
      // unadjustedVolume: json['unadjustedVolume'] as int,
      // change: json['change'] as double,
      // changePercent: json['changePercent'] as double,
      // vwap: json['vwap'] as double,
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
 
  void _updateData() {
    http
        .get('https://api.iextrading.com/1.0/stock/$text3/quote?displayPercent=true')
        .then((http.Response response) {
      if (response.statusCode == 200) {
        setState(() {
          _user = User.fromJson(json.decode(response.body));
        });
      }
    });
  }
  User _user;
  Map data;
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
        child: Text(_user?.symbol?.toString() ?? '',
      ),
      ),
    );
  }
}
// Text(
//           _user?.symbol?.toString() ?? '',
