// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppResponse<T> _$AppResponseFromJson<T>(Map<String, dynamic> json) =>
    AppResponse<T>(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$AppResponseToJson<T>(AppResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

UserResponse<T> _$UserResponseFromJson<T>(Map<String, dynamic> json) =>
    UserResponse<T>(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'],
    );

Map<String, dynamic> _$UserResponseToJson<T>(UserResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };

RefResponse<T> _$RefResponseFromJson<T>(Map<String, dynamic> json) =>
    RefResponse<T>(
      first: json['first'] as Map<String, dynamic>?,
      previous: json['previous'] as Map<String, dynamic>?,
      next: json['next'] as Map<String, dynamic>?,
      items: json['items'] as List<dynamic>,
    );

Map<String, dynamic> _$RefResponseToJson<T>(RefResponse<T> instance) =>
    <String, dynamic>{
      'first': instance.first,
      'previous': instance.previous,
      'next': instance.next,
      'items': instance.items,
    };

ListResponse<T> _$ListResponseFromJson<T>(Map<String, dynamic> json) =>
    ListResponse<T>(
      status: json['status'] as int,
      message: json['message'] as String,
      data: json['data'] as List<dynamic>,
    );

Map<String, dynamic> _$ListResponseToJson<T>(ListResponse<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
    };
