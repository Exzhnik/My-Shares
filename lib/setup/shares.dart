import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_shares/setup/data_search.dart';
import 'package:json_annotation/json_annotation.dart';

part 'shares.g.dart';



// Future<List<Shares>> fetchShares(http.Client client) async {
//   final response = await client.get(
//       'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=AMD&apikey=GGGY02OO6F2TGGOC');

//   return compute(parseShares, response.body);
// }

// List<Shares> parseShares(String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

//   return parsed.map<Shares>((json) => Shares.fromJson(json)).toList();
// }

@JsonSerializable()
class Shares {
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

  Shares(
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

     factory Shares.fromJson(Map<String, dynamic> json) => _$SharesFromJson(json);
}
