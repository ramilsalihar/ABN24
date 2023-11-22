// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Oblast _$OblastFromJson(Map<String, dynamic> json) => Oblast(
      id: json['id'] as String,
      region_name: json['region_name'] as String,
    );

Map<String, dynamic> _$OblastToJson(Oblast instance) => <String, dynamic>{
      'id': instance.id,
      'region_name': instance.region_name,
    };

District _$DistrictFromJson(Map<String, dynamic> json) => District(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$DistrictToJson(District instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

Locality _$LocalityFromJson(Map<String, dynamic> json) => Locality(
      id: json['id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$LocalityToJson(Locality instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

MaritalStatus _$MaritalStatusFromJson(Map<String, dynamic> json) =>
    MaritalStatus(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$MaritalStatusToJson(MaritalStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
