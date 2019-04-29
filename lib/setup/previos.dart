class Previos {
  var symbol;
  var companyName;
  var primaryExchange;
  var sector;
  var calculationPrice;
  var open;
  var openTime;
  var close;
  var closeTime;
  var high;
  var low;
  var latestPrice;
  var latestSource;
  var latestTime;
  var latestUpdate;
  var latestVolume;
  var iexRealtimePrice;
  var iexRealtimeSize;
  var iexLastUpdated;
  var delayedPrice;
  var delayedPriceTime;
  var extendedPrice;
  var extendedChange;
  var extendedChangePercent;
  var extendedPriceTime;
  var previousClose;
  var change;
  var changePercent;
  var iexMarketPercent;
  var iexVolume;
  var avgTotalVolume;
  var iexBidPrice;
  var iexBidSize;
  var iexAskPrice;
  var iexAskSize;
  var marketCap;
  var peRatio;
  var week52High;
  var week52Low;
  var ytdChange;

  Previos(
      {this.symbol,
      this.companyName,
      this.primaryExchange,
      this.sector,
      this.calculationPrice,
      this.open,
      this.openTime,
      this.close,
      this.closeTime,
      this.high,
      this.low,
      this.latestPrice,
      this.latestSource,
      this.latestTime,
      this.latestUpdate,
      this.latestVolume,
      this.iexRealtimePrice,
      this.iexRealtimeSize,
      this.iexLastUpdated,
      this.delayedPrice,
      this.delayedPriceTime,
      this.extendedPrice,
      this.extendedChange,
      this.extendedChangePercent,
      this.extendedPriceTime,
      this.previousClose,
      this.change,
      this.changePercent,
      this.iexMarketPercent,
      this.iexVolume,
      this.avgTotalVolume,
      this.iexBidPrice,
      this.iexBidSize,
      this.iexAskPrice,
      this.iexAskSize,
      this.marketCap,
      this.peRatio,
      this.week52High,
      this.week52Low,
      this.ytdChange});

  factory Previos.fromJson(Map<String, dynamic> json) {
    return Previos(
      symbol: json['symbol'],
      companyName: json['companyName'],
      primaryExchange: json['primaryExchange'],
      sector: json['sector'],
      calculationPrice: json['calculationPrice'],
      open: json['open'],
      openTime: json['openTime'],
      close: json['close'],
      closeTime: json['closeTime'],
      high: json['high'],
      low: json['low'],
      latestPrice: json['latestPrice'],
      latestSource: json['latestSource'],
      latestTime: json['latestTime'],
      latestUpdate: json['latestUpdate'],
      latestVolume: json['latestVolume'],
      iexRealtimePrice: json['iexRealtimePrice'],
      iexRealtimeSize: json['iexRealtimeSize'],
      iexLastUpdated: json['iexLastUpdated'],
      delayedPrice: json['delayedPrice'],
      delayedPriceTime: json['delayedPriceTime'],
      extendedPrice: json['extendedPrice'],
      extendedChange: json['extendedChange'],
      extendedChangePercent: json['extendedChangePercent'],
      extendedPriceTime: json['extendedPriceTime'],
      previousClose: json['previousClose'],
      change: json['change'],
      changePercent: json['changePercent'],
      iexMarketPercent: json['iexMarketPercent'],
      iexVolume: json['iexVolume'],
      avgTotalVolume: json['avgTotalVolume'],
      iexBidPrice: json['iexBidPrice'],
      iexBidSize: json['iexBidSize'],
      iexAskPrice: json['iexAskPrice'],
      iexAskSize: json['iexAskSize'],
      marketCap: json['marketCap'],
      peRatio: json['peRatio'],
      week52High: json['week52High'],
      week52Low: json['week52Low'],
      ytdChange: json['ytdChange'],
    );
  }
}
