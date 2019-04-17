

import 'package:my_shares/setup/shares.dart';

class StocksInfo {
  StocksInfo._(this._data, this._app);

  final Shares _app;

  final Map<dynamic, dynamic> _data;


  String get symbol => _data['symbol'];

  
  String get name => _data['name'];


  @override
  String toString() {
    return '$runtimeType($_data)';
  }
}