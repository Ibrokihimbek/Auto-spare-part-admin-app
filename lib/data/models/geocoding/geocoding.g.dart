// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Geocoding _$GeocodingFromJson(Map<String, dynamic> json) => Geocoding(
  response: MyResponse.fromJson(json['response'] as Map<String, dynamic>),
);

Map<String, dynamic> _$GeocodingToJson(Geocoding instance) => <String, dynamic>{
  'response': instance.response.toJson(),
};