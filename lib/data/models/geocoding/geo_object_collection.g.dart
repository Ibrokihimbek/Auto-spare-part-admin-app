// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_object_collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoObjectCollection _$GeoObjectCollectionFromJson(Map<String, dynamic> json) =>
    GeoObjectCollection(
      featureMember: (json['featureMember'] as List<dynamic>)
          .map((e) => FeatureMember.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GeoObjectCollectionToJson(
    GeoObjectCollection instance) =>
    <String, dynamic>{
      'featureMember': instance.featureMember.map((e) => e.toJson()).toList(),
    };