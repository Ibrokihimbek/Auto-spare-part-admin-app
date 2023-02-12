// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDetails _$AddressDetailsFromJson(Map<String, dynamic> json) =>
    AddressDetails(
      country: Country.fromJson(json['Country'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressDetailsToJson(AddressDetails instance) =>
    <String, dynamic>{
      'Country': instance.country.toJson(),
    };