import 'package:json_annotation/json_annotation.dart';

part 'signup_data.g.dart';

@JsonSerializable()
class SignupData {
  int status;
  String message;

  SignupData(this.status, this.message);

  factory SignupData.fromJson(Map<String, dynamic> json) => _$SignupDataFromJson(json);
}