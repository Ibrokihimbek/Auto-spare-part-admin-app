// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoObject _$GeoObjectFromJson(Map<String, dynamic> json) => GeoObject(
  metaDataProperty: MetaDataProperty.fromJson(
      json['metaDataProperty'] as Map<String, dynamic>),
  name: json['name'] as String? ?? '',
  description: json['description'] as String? ?? '',
);

Map<String, dynamic> _$GeoObjectToJson(GeoObject instance) => <String, dynamic>{
  'metaDataProperty': instance.metaDataProperty.toJson(),
  'name': instance.name,
  'description': instance.description,
};