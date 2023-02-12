import 'package:json_annotation/json_annotation.dart';
import 'geo_object.dart';
part 'feature_member.g.dart';

@JsonSerializable(explicitToJson: true)
class FeatureMember {
  @JsonKey(name: 'GeoObject')
  GeoObject geoObject;

  FeatureMember({required this.geoObject});

  factory FeatureMember.fromJson(Map<String, dynamic> json) =>
      _$FeatureMemberFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureMemberToJson(this);
}