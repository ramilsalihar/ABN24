import 'package:json_annotation/json_annotation.dart';

part 'info_model.g.dart';

@JsonSerializable()
class Location {
  String id;
  String name;
  List<LocationChild> childs;

  Location({required this.id, required this.name, required this.childs});

  factory Location.fromJson(Map<String, dynamic> json) => _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class LocationChild {
  String id;
  String name;
  String address;
  String link;

  LocationChild({required this.id, required this.name, required this.address, required this.link});

  factory LocationChild.fromJson(Map<String, dynamic> json) => _$LocationChildFromJson(json);
  Map<String, dynamic> toJson() => _$LocationChildToJson(this);
}

@JsonSerializable()
class Account {
  String id;
  String name;
  List<String> childs;

  Account(this.id, this.name, this.childs);

  factory Account.fromJson(Map<String, dynamic> json) => _$AccountFromJson(json);
  Map<String, dynamic> toJson() => _$AccountToJson(this);
}

@JsonSerializable()
class ContactItem {
  String id;
  String name;
  String type;
  List<String> childs;

  ContactItem(this.id, this.name, this.type, this.childs);

  factory ContactItem.fromJson(Map<String, dynamic> json) =>
      _$ContactItemFromJson(json);

  Map<String, dynamic> toJson() => _$ContactItemToJson(this);
}

@JsonSerializable()
class CreditData {
  final String title;
  final String description;

  CreditData({
    required this.title,
    required this.description,
  });

  factory CreditData.fromJson(Map<String, dynamic> json) =>
      _$CreditDataFromJson(json);
  Map<String, dynamic> toJson() => _$CreditDataToJson(this);
}

@JsonSerializable()
class PaymentItem {
  String id;
  String name;
  List<String> childs;

  PaymentItem(this.id, this.name, this.childs);

  factory PaymentItem.fromJson(Map<String, dynamic> json) =>
      _$PaymentItemFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentItemToJson(this);
}