import 'package:json_annotation/json_annotation.dart';

part 'confirm_sms_data.g.dart';

@JsonSerializable()
class ConfirmSmsData {
  int status;
  String message;
  @JsonKey(defaultValue: null)
  String? token;

  ConfirmSmsData(this.status, this.message, this.token);

  factory ConfirmSmsData.fromJson(Map<String, dynamic> json) =>
      _$ConfirmSmsDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConfirmSmsDataToJson(this);
}