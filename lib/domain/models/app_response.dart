import 'package:json_annotation/json_annotation.dart';

part 'app_response.g.dart';

@JsonSerializable()
class AppResponse<T> {
  final int status;
  final String message;
  final List<dynamic> data;

  AppResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AppResponse.fromJson(Map<String, dynamic> json) =>
      _$AppResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AppResponseToJson(this);
}

@JsonSerializable()
class UserResponse<T> {
  final int status;
  final String message;
  final dynamic data;

  UserResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}

@JsonSerializable()
class RefResponse<T> {
  final Map<String, dynamic>? first;
  final Map<String, dynamic>? previous;
  final Map<String, dynamic>? next;
  final List<dynamic> items;

  RefResponse({this.first, this.previous, this.next, required this.items});

  factory RefResponse.fromJson(Map<String, dynamic> json) =>
      _$RefResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RefResponseToJson(this);
}

@JsonSerializable()
class ListResponse<T> {
  final int status;
  final String message;
  final List<dynamic> data;

  ListResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ListResponse.fromJson(Map<String, dynamic> json) =>
      _$ListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ListResponseToJson(this);
}
