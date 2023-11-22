// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      file_check: json['file_check'] as int? ?? 0,
      email: json['email'] as String,
      id: json['id'] as String? ?? '',
      phone: json['phone'] as String,
      first_name: json['first_name'] as String,
      last_name: json['last_name'] as String,
      second_name: json['second_name'] as String,
      sex: json['sex'] as String,
      birth_date: json['birth_date'] as String,
      marital_status: json['marital_status'] as String,
      passport: Passport.fromJson(json['passport'] as Map<String, dynamic>),
      address_regist:
          AddressReg.fromJson(json['address_regist'] as Map<String, dynamic>),
      address_fact:
          AddressFact.fromJson(json['address_fact'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'file_check': instance.file_check,
      'email': instance.email,
      'id': instance.id,
      'phone': instance.phone,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'second_name': instance.second_name,
      'sex': instance.sex,
      'birth_date': instance.birth_date,
      'marital_status': instance.marital_status,
      'passport': instance.passport,
      'address_regist': instance.address_regist,
      'address_fact': instance.address_fact,
    };

Passport _$PassportFromJson(Map<String, dynamic> json) => Passport(
      id_doc_ser: json['id_doc_ser'] as String,
      id_doc_no: json['id_doc_no'] as String,
      id_doc_date: json['id_doc_date'] as String,
      id_doc_info: json['id_doc_info'] as String,
    );

Map<String, dynamic> _$PassportToJson(Passport instance) => <String, dynamic>{
      'id_doc_ser': instance.id_doc_ser,
      'id_doc_no': instance.id_doc_no,
      'id_doc_date': instance.id_doc_date,
      'id_doc_info': instance.id_doc_info,
    };

AddressReg _$AddressRegFromJson(Map<String, dynamic> json) => AddressReg(
      region_id_1: json['region_id_1'] as String?,
      region_id_2: json['region_id_2'] as String?,
      region_id_3: json['region_id_3'] as String?,
      address: json['address'] as String,
      house: json['house'] as String,
      flat: json['flat'] as String,
    );

Map<String, dynamic> _$AddressRegToJson(AddressReg instance) =>
    <String, dynamic>{
      'region_id_1': instance.region_id_1,
      'region_id_2': instance.region_id_2,
      'region_id_3': instance.region_id_3,
      'address': instance.address,
      'house': instance.house,
      'flat': instance.flat,
    };

AddressFact _$AddressFactFromJson(Map<String, dynamic> json) => AddressFact(
      region_id_1: json['region_id_1'] as String?,
      region_id_2: json['region_id_2'] as String?,
      region_id_3: json['region_id_3'] as String?,
      address: json['address'] as String,
      house: json['house'] as String,
      flat: json['flat'] as String,
    );

Map<String, dynamic> _$AddressFactToJson(AddressFact instance) =>
    <String, dynamic>{
      'region_id_1': instance.region_id_1,
      'region_id_2': instance.region_id_2,
      'region_id_3': instance.region_id_3,
      'address': instance.address,
      'house': instance.house,
      'flat': instance.flat,
    };
