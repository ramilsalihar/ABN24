// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditRequest _$CreditRequestFromJson(Map<String, dynamic> json) =>
    CreditRequest(
      amount: json['amount'] as String,
      commission: json['commission'] as String,
      product: json['product'] as String,
      revId: json['revId'] as String,
      timePeriod: json['timePeriod'] as String,
      contactFio: json['contactFio'] as String,
      contactPhone: json['contactPhone'] as String,
      whoIs: json['whoIs'] as String,
      contactFio2: json['contactFio2'] as String,
      contactPhone2: json['contactPhone2'] as String,
      whoIs2: json['whoIs2'] as String,
      job: json['job'] as String,
      jobPosition: json['jobPosition'] as String,
      averageIncome: json['averageIncome'] as String,
    );

Map<String, dynamic> _$CreditRequestToJson(CreditRequest instance) =>
    <String, dynamic>{
      'amount': instance.amount,
      'commission': instance.commission,
      'product': instance.product,
      'revId': instance.revId,
      'timePeriod': instance.timePeriod,
      'contactFio': instance.contactFio,
      'contactPhone': instance.contactPhone,
      'whoIs': instance.whoIs,
      'contactFio2': instance.contactFio2,
      'contactPhone2': instance.contactPhone2,
      'whoIs2': instance.whoIs2,
      'job': instance.job,
      'jobPosition': instance.jobPosition,
      'averageIncome': instance.averageIncome,
    };
