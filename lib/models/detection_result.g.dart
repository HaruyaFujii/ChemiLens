// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detection_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetectionResult _$DetectionResultFromJson(Map<String, dynamic> json) =>
    _DetectionResult(
      objectName: json['objectName'] as String,
      molecules: (json['molecules'] as List<dynamic>)
          .map((e) => Compound.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetectionResultToJson(_DetectionResult instance) =>
    <String, dynamic>{
      'objectName': instance.objectName,
      'molecules': instance.molecules,
    };
