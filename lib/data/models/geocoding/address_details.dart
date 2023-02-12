import 'package:json_annotation/json_annotation.dart';
import 'country.dart';
part 'address_details.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressDetails {
  @JsonKey(name: 'Country')
  Country country;
  AddressDetails({required this.country});

  factory AddressDetails.fromJson(Map<String, dynamic> json) =>
      _$AddressDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$AddressDetailsToJson(this);
}