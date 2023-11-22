import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class UserData {
  final int file_check;
  final String email;
  final String id;
  final String phone;
  final String first_name;
  final String last_name;
  final String second_name;
  final String sex;
  final String birth_date;
  final String marital_status;
  final Passport passport;
  final AddressReg address_regist;
  final AddressFact address_fact;

  UserData({
    this.file_check = 0,
    required this.email,
    this.id = '',
    required this.phone,
    required this.first_name,
    required this.last_name,
    required this.second_name,
    required this.sex,
    required this.birth_date,
    required this.marital_status,
    required this.passport,
    required this.address_regist,
    required this.address_fact,
  });


  UserData copyWith({
    int? file_check,
    String? email,
    String? id,
    String? phone,
    String? first_name,
    String? last_name,
    String? second_name,
    String? sex,
    String? birth_date,
    String? marital_status,
    Passport? passport,
    AddressReg? address_regist,
    AddressFact? address_fact,
  }) {
    return UserData(
      file_check: file_check ?? this.file_check,
      email: email ?? this.email,
      id: id ?? this.id,
      phone: phone ?? this.phone,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      second_name: second_name ?? this.second_name,
      sex: sex ?? this.sex,
      birth_date: birth_date ?? this.birth_date,
      marital_status: marital_status ?? this.marital_status,
      passport: passport ?? this.passport,
      address_regist: address_regist ?? this.address_regist,
      address_fact: address_fact ?? this.address_fact,
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}

@JsonSerializable()
class Passport {
  final String id_doc_ser;
  final String id_doc_no;
  final String id_doc_date;
  final String id_doc_info;

  Passport({
    required this.id_doc_ser,
    required this.id_doc_no,
    required this.id_doc_date,
    required this.id_doc_info,
  });

  Passport copyWith({
    String? id_doc_ser,
    String? id_doc_no,
    String? id_doc_date,
    String? id_doc_info,
  }) {
    return Passport(
      id_doc_ser: id_doc_ser ?? this.id_doc_ser,
      id_doc_no: id_doc_no ?? this.id_doc_no,
      id_doc_date: id_doc_date ?? this.id_doc_date,
      id_doc_info: id_doc_info ?? this.id_doc_info,
    );
  }

  factory Passport.fromJson(Map<String, dynamic> json) =>
      _$PassportFromJson(json);

  Map<String, dynamic> toJson() => _$PassportToJson(this);
}

@JsonSerializable()
class AddressReg {
  final String? region_id_1;
  final String? region_id_2;
  final String? region_id_3;
  final String address;
  final String house;
  final String flat;

  AddressReg({
    required this.region_id_1,
    required this.region_id_2,
    required this.region_id_3,
    required this.address,
    required this.house,
    required this.flat,
  });

  AddressReg copyWith({
    String? region_id_1,
    String? region_id_2,
    String? region_id_3,
    String? address,
    String? house,
    String? flat,
  }) {
    return AddressReg(
      region_id_1: region_id_1 ?? this.region_id_1,
      region_id_2: region_id_2 ?? this.region_id_2,
      region_id_3: region_id_3 ?? this.region_id_3,
      address: address ?? this.address,
      house: house ?? this.house,
      flat: flat ?? this.flat,
    );
  }

  factory AddressReg.fromJson(Map<String, dynamic> json) =>
      _$AddressRegFromJson(json);

  Map<String, dynamic> toJson() => _$AddressRegToJson(this);
}

@JsonSerializable()
class AddressFact {
  final String? region_id_1;
  final String? region_id_2;
  final String? region_id_3;
  final String address;
  final String house;
  final String flat;

  AddressFact({
    required this.region_id_1,
    required this.region_id_2,
    required this.region_id_3,
    required this.address,
    required this.house,
    required this.flat,
  });

  AddressFact copyWith({
    String? region_id_1,
    String? region_id_2,
    String? region_id_3,
    String? address,
    String? house,
    String? flat,
  }) {
    return AddressFact(
      region_id_1: region_id_1 ?? this.region_id_1,
      region_id_2: region_id_2 ?? this.region_id_2,
      region_id_3: region_id_3 ?? this.region_id_3,
      address: address ?? this.address,
      house: house ?? this.house,
      flat: flat ?? this.flat,
    );
  }

  factory AddressFact.fromJson(Map<String, dynamic> json) =>
      _$AddressFactFromJson(json);

  Map<String, dynamic> toJson() => _$AddressFactToJson(this);
}
