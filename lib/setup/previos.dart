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
      this.vwap
      });

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
