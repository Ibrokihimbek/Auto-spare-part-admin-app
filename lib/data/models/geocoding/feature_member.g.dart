// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_member.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureMember _$FeatureMemberFromJson(Map<String, dynamic> json) =>
    FeatureMember(
      geoObject: GeoObject.fromJson(json['GeoObject'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FeatureMemberToJson(FeatureMember instance) =>
    <String, dynamic>{
      'GeoObject': instance.geoObject.toJson(),
    };