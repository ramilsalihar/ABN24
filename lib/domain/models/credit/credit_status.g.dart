// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditStatus _$CreditStatusFromJson(Map<String, dynamic> json) => CreditStatus(
      id: json['id'] as String,
      status: json['status'] as String,
      start_date: json['start_date'] as String,
      end_date: json['end_date'] as String,
      issued: json['issued'] as String,
      paid_of: json['paid_of'] as String,
    );

Map<String, dynamic> _$CreditStatusToJson(CreditStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'start_date': instance.start_date,
      'end_date': instance.end_date,
      'issued': instance.issued,
      'paid_of': instance.paid_of,
    };
