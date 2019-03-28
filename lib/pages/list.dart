import 'package:flutter/material.dart';
import 'package:my_shares/setup/sharesList.dart';
import 'package:my_shares/setup/data_search.dart';

class ShaList extends StatelessWidget {
  final List<ListShares> stock;

  ShaList({Key key, this.stock}) : super(key: key);
   
  

  @override
  Widget build(BuildContext context) {
    SearchData().buildResults(context);
  }
}
