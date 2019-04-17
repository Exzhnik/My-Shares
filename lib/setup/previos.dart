import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;




class Previos {
  final String symbol;
  final String date;
  final double open;
  final double high;
  final double low;
  final double close;
  final int volume;
  final int unadjustedVolume;
  final double change;
  final double changePercent;
  final double vwap;

  Previos(
      {this.symbol,
      this.date,
      this.open,
      this.high,
      this.low,
      this.close,
      this.volume,
      this.unadjustedVolume,
      this.change,
      this.changePercent,
      this.vwap});

  factory Previos.fromJson(Map<String, dynamic> json) {
    return Previos(
      symbol: json['symbol'] as String,
      date: json['date'] as String,
      open: json['open'] as double,
      high: json['hing'] as double,
      low: json['low'] as double,
      close: json['close'] as double,
      volume: json['volume'] as int,
      unadjustedVolume: json['unadjustedVolume'] as int,
      change: json['change'] as double,
      changePercent: json['changePercent'] as double,
      vwap: json['vwap'] as double,
    );
  }
}

// import 'dart:convert';
// import 'dart:async';
// import 'package:flutter/foundation.dart';
// import 'package:http/http.dart' as http;

// import 'package:flutter/material.dart';
// import 'package:my_shares/pages/home.dart';
// import 'package:my_shares/setup/previos.dart';
// import 'package:my_shares/setup/shares.dart';

// class Stocks extends StatelessWidget {
//   final String text;
  

//   Stocks({Key key, @required this.text}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     var networkImage = NetworkImage(
//         'https://storage.googleapis.com/iex/api/logos/$text.png');

//     var card = Card(
//       child: Column(
//         children: <Widget>[
//           CircleAvatar(
//             backgroundImage: networkImage,
//             radius: 30,
//           ),
//           Text(text)
//         ],
//       ),
//     );
//     return Scaffold(
//         backgroundColor: Color(0xFF5C6DC0),
//         appBar: AppBar(
//           title: Text('TEXT'),
//         ),
//         body: card
//         );
//   }
// }
