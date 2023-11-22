import 'package:json_annotation/json_annotation.dart';

part 'list_model.g.dart';

@JsonSerializable()
class Oblast {
  final String id;
  final String region_name;

  Oblast({
    required this.id,
    required this.region_name,
  });

  factory Oblast.fromJson(Map<String, dynamic> json) =>
      _$OblastFromJson(json);

  Map<String, dynamic> toJson() => _$OblastToJson(this);
}

@JsonSerializable()
class District {
  final String id;
  final String name;

  District({
    required this.id,
    required this.name,
  });

  factory District.fromJson(Map<String, dynamic> json) =>
      _$DistrictFromJson(json);

  Map<String, dynamic> toJson() => _$DistrictToJson(this);
}

@JsonSerializable()
class Locality {
  final String id;
  final String name;

  Locality({
    required this.id,
    required this.name,
  });

  factory Locality.fromJson(Map<String, dynamic> json) =>
      _$LocalityFromJson(json);

  Map<String, dynamic> toJson() => _$LocalityToJson(this);
}

@JsonSerializable()
class MaritalStatus {
  final int id;
  final String name;

  MaritalStatus({
    required this.id,
    required this.name,
  });

  factory MaritalStatus.fromJson(Map<String, dynamic> json) =>
      _$MaritalStatusFromJson(json);

  Map<String, dynamic> toJson() => _$MaritalStatusToJson(this);
}

