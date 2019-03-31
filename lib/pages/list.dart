import 'package:flutter/material.dart';
import 'package:my_shares/setup/shares.dart';
import 'package:my_shares/setup/data_search.dart';

class ShaList extends StatelessWidget {
  final List<Shares> stock;

  ShaList({Key key, this.stock}) : super(key: key);
   
  

  @override
  Widget build(BuildContext context) {
    SearchData().buildResults(context);
  }
}
