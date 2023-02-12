import 'package:json_annotation/json_annotation.dart';
import 'meta_data_property.dart';
part 'geo_object.g.dart';

@JsonSerializable(explicitToJson: true)
class GeoObject {
  @JsonKey(name: 'metaDataProperty')
  MetaDataProperty metaDataProperty;
  @JsonKey(defaultValue: '')
  String name;
  @JsonKey(defaultValue: '')
  String description;

  GeoObject(
      {required this.metaDataProperty,
        required this.name,
        required this.description});

  factory GeoObject.fromJson(Map<String, dynamic> json) =>
      _$GeoObjectFromJson(json);
  Map<String, dynamic> toJson() => _$GeoObjectToJson(this);
}