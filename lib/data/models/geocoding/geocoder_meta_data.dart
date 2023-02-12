import 'package:json_annotation/json_annotation.dart';
import 'address_details.dart';
part 'geocoder_meta_data.g.dart';

@JsonSerializable(explicitToJson: true)
class GeocoderMetaData {
  @JsonKey(defaultValue: '')
  String precision;
  @JsonKey(defaultValue: '')
  String text;
  @JsonKey(defaultValue: '')
  String kind;
  @JsonKey(name: 'AddressDetails')
  AddressDetails addressDetails;

  GeocoderMetaData(
      {required this.precision,
        required this.text,
        required this.kind,
        required this.addressDetails});
  factory GeocoderMetaData.fromJson(Map<String, dynamic> json) =>
      _$GeocoderMetaDataFromJson(json);
  Map<String, dynamic> toJson() => _$GeocoderMetaDataToJson(this);
}