// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
  addressLine: json['AddressLine'] as String? ?? '',
  countryNameCode: json['CountryNameCode'] as String? ?? '',
  countryName: json['CountryName'] as String? ?? '',
);

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
  'AddressLine': instance.addressLine,
  'CountryNameCode': instance.countryNameCode,
  'CountryName': instance.countryName,
};