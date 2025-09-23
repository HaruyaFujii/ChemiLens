// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HistoryItem _$HistoryItemFromJson(Map<String, dynamic> json) => _HistoryItem(
  id: json['id'] as String,
  userId: json['userId'] as String,
  imageUrl: json['imageUrl'] as String,
  objectName: json['objectName'] as String,
  compounds: (json['compounds'] as List<dynamic>)
      .map((e) => Compound.fromJson(e as Map<String, dynamic>))
      .toList(),
  cids: (json['cids'] as List<dynamic>).map((e) => e as String).toList(),
  isFavorite: json['isFavorite'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$HistoryItemToJson(_HistoryItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'imageUrl': instance.imageUrl,
      'objectName': instance.objectName,
      'compounds': instance.compounds,
      'cids': instance.cids,
      'isFavorite': instance.isFavorite,
      'createdAt': instance.createdAt.toIso8601String(),
    };
