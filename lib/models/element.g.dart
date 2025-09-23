// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'element.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Element _$ElementFromJson(Map<String, dynamic> json) => _Element(
  symbol: json['symbol'] as String,
  name: json['name'] as String,
  atomicNumber: (json['atomicNumber'] as num).toInt(),
  iconUrl: json['iconUrl'] as String?,
  discovered: json['discovered'] as bool? ?? false,
);

Map<String, dynamic> _$ElementToJson(_Element instance) => <String, dynamic>{
  'symbol': instance.symbol,
  'name': instance.name,
  'atomicNumber': instance.atomicNumber,
  'iconUrl': instance.iconUrl,
  'discovered': instance.discovered,
};

_UserElementProgress _$UserElementProgressFromJson(Map<String, dynamic> json) =>
    _UserElementProgress(
      userId: json['userId'] as String,
      elementSymbol: json['elementSymbol'] as String,
      isDiscovered: json['isDiscovered'] as bool,
      discoveredAt: json['discoveredAt'] == null
          ? null
          : DateTime.parse(json['discoveredAt'] as String),
      viewCount: (json['viewCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserElementProgressToJson(
  _UserElementProgress instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'elementSymbol': instance.elementSymbol,
  'isDiscovered': instance.isDiscovered,
  'discoveredAt': instance.discoveredAt?.toIso8601String(),
  'viewCount': instance.viewCount,
};
