// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyResponse _$MyResponseFromJson(Map<String, dynamic> json) => MyResponse(
  geoObjectCollection: GeoObjectCollection.fromJson(
      json['GeoObjectCollection'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MyResponseToJson(MyResponse instance) =>
    <String, dynamic>{
      'GeoObjectCollection': instance.geoObjectCollection.toJson(),
    };