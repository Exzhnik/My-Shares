import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_shares/setup/data_search.dart';

Future<List<ListShares>> fetchShares(http.Client client) async {
  final response = await client.get(
      'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=AMD&apikey=GGGY02OO6F2TGGOC');

  return compute(parseShares, response.body);
}

List<ListShares> parseShares(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<ListShares>((json) => ListShares.fromJson(json)).toList();
}

class ListShares {
  final String s1Symbol;
  final String s2Name;
  final String s3Type;
  final String s4Region;
  final String s5MarketOpen;
  final String s6MarketClose;
  final String s7Timezone;
  final String s8Currency;
  final String s9MatchScore;
  bool isSelected;

  ListShares(
      {this.s1Symbol,
      this.s2Name,
      this.s3Type,
      this.s4Region,
      this.s5MarketOpen,
      this.s6MarketClose,
      this.s7Timezone,
      this.s8Currency,
      this.s9MatchScore,
      this.isSelected = false});

  factory ListShares.fromJson(Map<String, dynamic> json) {
    return ListShares(
      s1Symbol: json['symbol'] as String,
      s2Name: json['name'] as String,
      s3Type: json['type'] as String,
      s4Region: json['region'] as String,
      s5MarketOpen: json['marketopen'] as String,
      s6MarketClose: json['marketclose'] as String,
      s7Timezone: json['timezone'] as String,
      s8Currency: json['currency'] as String,
      s9MatchScore: json['matchscope'] as String,
    );
  }
}
