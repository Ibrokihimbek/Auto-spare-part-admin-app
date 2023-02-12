// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoder_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocoderMetaData _$GeocoderMetaDataFromJson(Map<String, dynamic> json) =>
    GeocoderMetaData(
      precision: json['precision'] as String? ?? '',
      text: json['text'] as String? ?? '',
      kind: json['kind'] as String? ?? '',
      addressDetails: AddressDetails.fromJson(
          json['AddressDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeocoderMetaDataToJson(GeocoderMetaData instance) =>
    <String, dynamic>{
      'precision': instance.precision,
      'text': instance.text,
      'kind': instance.kind,
      'AddressDetails': instance.addressDetails.toJson(),
    };