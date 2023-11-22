import 'package:json_annotation/json_annotation.dart';

part 'credit_status.g.dart';

@JsonSerializable()
class CreditStatus {
  String id;
  String status;
  String start_date;
  String end_date;
  String issued;
  String paid_of;

  CreditStatus({
    required this.id,
    required this.status,
    required this.start_date,
    required this.end_date,
    required this.issued,
    required this.paid_of,
  });

  double _paidOfFloat = 0;
  double get paidOfFloat {
    if (paid_of.trim().isNotEmpty) {
      return double.parse(paid_of.replaceAll(",", "."));
    }
    return 0;
  }

  double _issuedFloat = 0;
  double get issuedFloat {
    if (issued.trim().isNotEmpty) {
      return double.parse(issued.replaceAll(",", "."));
    }
    return 0;
  }


  factory CreditStatus.fromJson(Map<String, dynamic> json) => _$CreditStatusFromJson(json);
  Map<String, dynamic> toJson() => _$CreditStatusToJson(this);
}
