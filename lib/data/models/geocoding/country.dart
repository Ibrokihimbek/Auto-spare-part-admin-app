import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  @JsonKey(defaultValue: '', name: 'AddressLine')
  String addressLine;
  @JsonKey(defaultValue: '', name: 'CountryNameCode')
  String countryNameCode;
  @JsonKey(defaultValue: '', name: 'CountryName')
  String countryName;

  Country({
    required this.addressLine,
    required this.countryNameCode,
    required this.countryName,
  });

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}