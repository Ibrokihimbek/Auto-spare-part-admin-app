
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_data_property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaDataProperty _$MetaDataPropertyFromJson(Map<String, dynamic> json) =>
    MetaDataProperty(
      geocoderMetaData: GeocoderMetaData.fromJson(
          json['GeocoderMetaData'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaDataPropertyToJson(MetaDataProperty instance) =>
    <String, dynamic>{
      'GeocoderMetaData': instance.geocoderMetaData.toJson(),
    };