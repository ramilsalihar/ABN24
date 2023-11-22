import 'package:json_annotation/json_annotation.dart';

part 'login_data.g.dart';

@JsonSerializable()
class LoginData {
  int status;
  String? message;
  String? token;

  LoginData(this.status, this.message, this.token);

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
}