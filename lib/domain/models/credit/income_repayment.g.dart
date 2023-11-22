// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_repayment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IncomeRepayment _$IncomeRepaymentFromJson(Map<String, dynamic> json) =>
    IncomeRepayment(
      loanNumber: json['loan_number'] as String,
      date: json['date'] as String,
      sum: json['sum'] as String,
      percent: json['percent'] as String,
      fine: json['fine'] as String,
      delay: json['delay'] as String?,
    );

Map<String, dynamic> _$IncomeRepaymentToJson(IncomeRepayment instance) =>
    <String, dynamic>{
      'loan_number': instance.loanNumber,
      'date': instance.date,
      'sum': instance.sum,
      'percent': instance.percent,
      'fine': instance.fine,
      'delay': instance.delay,
    };
