import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:my_shares/pages/home.dart';
import 'package:my_shares/setup/previos.dart';
import 'package:my_shares/setup/shares.dart';

Future<List<Previos>> fetchPrevioss(http.Client client) async {
  final response =
      await client.get('https://api.iextrading.com/1.0/ref-data/symbols');

  // Use the compute function to run parsePrevioss in a separate isolate
  return compute(parsePrevioss, response.body);
}

// A function that converts a response body into a List<Previos>
List<Previos> parsePrevioss(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

  return parsed.map<Previos>((json) => Previos.fromJson(json)).toList();
}

class Stocks extends StatelessWidget {
  final String text;
  final List<Previos> previ;


  Stocks({Key key, @required this.text, this.previ}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: previ.length,
      itemBuilder: (context, index) {
        return Text(previ[index].symbol);
      },
    );
  }
}
