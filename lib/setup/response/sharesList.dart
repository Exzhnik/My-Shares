import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_shares/setup/data_search.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_shares/setup/shares.dart';

class SharesList extends StatefulWidget {
  final String title;

  const SharesList({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SharesListState();
}

class _SharesListState extends State<SharesList> {
  List<Shares> share = [];

  Future loadSharesList() async {
    http.Response responese = await http.get(
        'https://www.alphavantage.co/query?function=SYMBOL_SEARCH&keywords=BA&apikey=demo');
    String content = responese.body;
    List collection = json.decode(content);
    List<Shares> _share =
        collection.map((json) => Shares.fromJson(json)).toList();

    setState(() {
      share = _share;
    });

    void initState() {
      loadSharesList();
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: share.length,
      itemBuilder: (context, index) {
        Shares shar = share[index];
        Text('${shar.s2Name}');
      },
    );
  }
}
