import 'package:json_annotation/json_annotation.dart';
import 'geo_object_collection.dart';
part 'my_response.g.dart';

@JsonSerializable(explicitToJson: true)
class MyResponse {
  @JsonKey(name: 'GeoObjectCollection')
  GeoObjectCollection geoObjectCollection;

  MyResponse({required this.geoObjectCollection});

  factory MyResponse.fromJson(Map<String, dynamic> json) =>
      _$MyResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MyResponseToJson(this);
}