// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_sms_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfirmSmsData _$ConfirmSmsDataFromJson(Map<String, dynamic> json) =>
    ConfirmSmsData(
      json['status'] as int,
      json['message'] as String,
      json['token'] as String?,
    );

Map<String, dynamic> _$ConfirmSmsDataToJson(ConfirmSmsData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'token': instance.token,
    };
