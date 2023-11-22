import 'package:json_annotation/json_annotation.dart';

part 'credit.g.dart';

@JsonSerializable()
class Credit {
  int id;
  String name;
  String rev_id;
  String rev;
  String rev_available_date;
  String rev_status;
  String rev_message;
  String customer_status;
  Sum sum;

  Credit({
    required this.id,
    required this.name,
    required this.rev_id,
    required this.rev,
    required this.rev_available_date,
    required this.rev_status,
    required this.rev_message,
    required this.customer_status,
    required this.sum,
  });

  bool get isRev => rev == "Y" && rev_id.isNotEmpty;

  bool get isAvailable => int.tryParse(rev_status) == 0 || rev_status == null;

  bool get isCustomerStatusYes => customer_status.isNotEmpty && customer_status == "Y";

  factory Credit.fromJson(Map<String, dynamic> json) => _$CreditFromJson(json);
  Map<String, dynamic> toJson() => _$CreditToJson(this);
}

@JsonSerializable()
class Sum {
  String type;
  int spread;
  List<Details> details;

  Sum({
    required this.type,
    required this.spread,
    required this.details,
  });

  factory Sum.fromJson(Map<String, dynamic> json) => _$SumFromJson(json);
  Map<String, dynamic> toJson() => _$SumToJson(this);
}

@JsonSerializable()
class Details {
  int value;
  List<Commissions> commissions;

  Details({
    required this.value,
    required this.commissions,
  });

  factory Details.fromJson(Map<String, dynamic> json) => _$DetailsFromJson(json);
  Map<String, dynamic> toJson() => _$DetailsToJson(this);
}

@JsonSerializable()
class Commissions {
  String time;
  int commission;

  Commissions({
    required this.time,
    required this.commission,
  });

  factory Commissions.fromJson(Map<String, dynamic> json) => _$CommissionsFromJson(json);
  Map<String, dynamic> toJson() => _$CommissionsToJson(this);
}
