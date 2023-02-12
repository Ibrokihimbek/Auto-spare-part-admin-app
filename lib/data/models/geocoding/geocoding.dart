import 'package:json_annotation/json_annotation.dart';
import 'my_response.dart';
part 'geocoding.g.dart';

@JsonSerializable(explicitToJson: true)
class Geocoding {
  MyResponse response;
  Geocoding({required this.response});

  factory Geocoding.fromJson(Map<String, dynamic> json) =>
      _$GeocodingFromJson(json);
  Map<String, dynamic> toJson() => _$GeocodingToJson(this);
}