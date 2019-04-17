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
      this.isEnabled = false});

  factory Shares.fromJson(Map<String, dynamic> json) {
    return Shares(
      symbol: json['symbol'],
      name: json['name'],
      date: json['date'],
      type: json['type'],
    );
  }
}



