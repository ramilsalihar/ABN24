// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Credit _$CreditFromJson(Map<String, dynamic> json) => Credit(
      id: json['id'] as int,
      name: json['name'] as String,
      rev_id: json['rev_id'] as String,
      rev: json['rev'] as String,
      rev_available_date: json['rev_available_date'] as String,
      rev_status: json['rev_status'] as String,
      rev_message: json['rev_message'] as String,
      customer_status: json['customer_status'] as String,
      sum: Sum.fromJson(json['sum'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CreditToJson(Credit instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rev_id': instance.rev_id,
      'rev': instance.rev,
      'rev_available_date': instance.rev_available_date,
      'rev_status': instance.rev_status,
      'rev_message': instance.rev_message,
      'customer_status': instance.customer_status,
      'sum': instance.sum,
    };

Sum _$SumFromJson(Map<String, dynamic> json) => Sum(
      type: json['type'] as String,
      spread: json['spread'] as int,
      details: (json['details'] as List<dynamic>)
          .map((e) => Details.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SumToJson(Sum instance) => <String, dynamic>{
      'type': instance.type,
      'spread': instance.spread,
      'details': instance.details,
    };

Details _$DetailsFromJson(Map<String, dynamic> json) => Details(
      value: json['value'] as int,
      commissions: (json['commissions'] as List<dynamic>)
          .map((e) => Commissions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DetailsToJson(Details instance) => <String, dynamic>{
      'value': instance.value,
      'commissions': instance.commissions,
    };

Commissions _$CommissionsFromJson(Map<String, dynamic> json) => Commissions(
      time: json['time'] as String,
      commission: json['commission'] as int,
    );

Map<String, dynamic> _$CommissionsToJson(Commissions instance) =>
    <String, dynamic>{
      'time': instance.time,
      'commission': instance.commission,
    };
