import 'package:json_annotation/json_annotation.dart';

part 'income_repayment.g.dart';

@JsonSerializable()
class IncomeRepayment {
  @JsonKey(name: 'loan_number')
  String loanNumber;
  String date;
  String sum;
  String percent;
  String fine;
  String? delay;

  IncomeRepayment({
    required this.loanNumber,
    required this.date,
    required this.sum,
    required this.percent,
    required this.fine,
    this.delay,
  });


  // double _total = 0.0;
  double get total {
    if (sum.isNotEmpty) {
      if (percent.isNotEmpty && fine.isNotEmpty) {
        double sumD = double.parse(sum.replaceAll(",", "."));
        double percentD = double.parse(percent.replaceAll(",", "."));
        double fineD = double.parse(fine.replaceAll(",", "."));
        return ((sumD + percentD + fineD) * 100.0).round() / 100.0;
      }
      return double.parse(sum.replaceAll(",", "."));
    }
    return 0.0;
  }

  factory IncomeRepayment.fromJson(Map<String, dynamic> json) => _$IncomeRepaymentFromJson(json);
  Map<String, dynamic> toJson() => _$IncomeRepaymentToJson(this);
}
