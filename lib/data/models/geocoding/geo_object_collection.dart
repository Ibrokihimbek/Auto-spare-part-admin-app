import 'package:json_annotation/json_annotation.dart';
import 'feature_member.dart';
part 'geo_object_collection.g.dart';

@JsonSerializable(explicitToJson: true)
class GeoObjectCollection {
  @JsonKey(name: 'featureMember')
  List<FeatureMember> featureMember;

  GeoObjectCollection({required this.featureMember});
  factory GeoObjectCollection.fromJson(Map<String, dynamic> json) =>
      _$GeoObjectCollectionFromJson(json);
  Map<String, dynamic> toJson() => _$GeoObjectCollectionToJson(this);
}