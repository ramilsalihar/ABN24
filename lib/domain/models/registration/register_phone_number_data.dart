import 'package:json_annotation/json_annotation.dart';

part 'register_phone_number_data.g.dart';

@JsonSerializable()
class RegisterPhoneNumberData {
  int status;
  String message;

  RegisterPhoneNumberData(this.status, this.message);

  factory RegisterPhoneNumberData.fromJson(Map<String, dynamic> json) => _$RegisterPhoneNumberDataFromJson(json);
}