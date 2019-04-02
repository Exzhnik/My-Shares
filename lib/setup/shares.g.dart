// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shares.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Shares _$SharesFromJson(Map<String, dynamic> json) {
  return Shares(
      s1Symbol: json['s1Symbol'] as String,
      s2Name: json['s2Name'] as String,
      s3Type: json['s3Type'] as String,
      s4Region: json['s4Region'] as String,
      s5MarketOpen: json['s5MarketOpen'] as String,
      s6MarketClose: json['s6MarketClose'] as String,
      s7Timezone: json['s7Timezone'] as String,
      s8Currency: json['s8Currency'] as String,
      s9MatchScore: json['s9MatchScore'] as String,
      isSelected: json['isSelected'] as bool);
}

Map<String, dynamic> _$SharesToJson(Shares instance) => <String, dynamic>{
      's1Symbol': instance.s1Symbol,
      's2Name': instance.s2Name,
      's3Type': instance.s3Type,
      's4Region': instance.s4Region,
      's5MarketOpen': instance.s5MarketOpen,
      's6MarketClose': instance.s6MarketClose,
      's7Timezone': instance.s7Timezone,
      's8Currency': instance.s8Currency,
      's9MatchScore': instance.s9MatchScore,
      'isSelected': instance.isSelected
    };

