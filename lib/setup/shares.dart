import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_shares/setup/data_search.dart';
import 'package:json_annotation/json_annotation.dart';

class Shares {
  final String symbol;
  final String name;
  final String date;
  final String type;
  final int iexId;
  bool isEnabled;

  Shares(
      {this.symbol,
      this.name,
      this.date,
      this.type,
      this.iexId,
      this.isEnabled = true});

  factory Shares.fromJson(Map<String, dynamic> json) {
    return Shares(
      symbol: json['symbol'],
      name: json['name'],
      date: json['date'],
      type: json['type'],
    );
  }
}
class Logo{
  final String url;

  Logo({this.url});

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      url: json['url'],
    );
  }
}
