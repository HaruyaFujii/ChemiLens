// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'compound.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Compound _$CompoundFromJson(Map<String, dynamic> json) => _Compound(
  cid: json['cid'] as String,
  name: json['name'] as String,
  formula: json['formula'] as String,
  elements: (json['elements'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  description: json['description'] as String,
);

Map<String, dynamic> _$CompoundToJson(_Compound instance) => <String, dynamic>{
  'cid': instance.cid,
  'name': instance.name,
  'formula': instance.formula,
  'elements': instance.elements,
  'description': instance.description,
};
