// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
      id: json['id'] as String,
      name: json['name'] as String,
      childs: (json['childs'] as List<dynamic>)
          .map((e) => LocationChild.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'childs': instance.childs,
    };

LocationChild _$LocationChildFromJson(Map<String, dynamic> json) =>
    LocationChild(
      id: json['id'] as String,
      name: json['name'] as String,
      address: json['address'] as String,
      link: json['link'] as String,
    );

Map<String, dynamic> _$LocationChildToJson(LocationChild instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'link': instance.link,
    };

Account _$AccountFromJson(Map<String, dynamic> json) => Account(
      json['id'] as String,
      json['name'] as String,
      (json['childs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'childs': instance.childs,
    };

ContactItem _$ContactItemFromJson(Map<String, dynamic> json) => ContactItem(
      json['id'] as String,
      json['name'] as String,
      json['type'] as String,
      (json['childs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ContactItemToJson(ContactItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'childs': instance.childs,
    };

CreditData _$CreditDataFromJson(Map<String, dynamic> json) => CreditData(
      title: json['title'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$CreditDataToJson(CreditData instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };

PaymentItem _$PaymentItemFromJson(Map<String, dynamic> json) => PaymentItem(
      json['id'] as String,
      json['name'] as String,
      (json['childs'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PaymentItemToJson(PaymentItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'childs': instance.childs,
    };
