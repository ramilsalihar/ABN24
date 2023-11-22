import 'package:json_annotation/json_annotation.dart';

part 'credit_request.g.dart';

@JsonSerializable()
class CreditRequest {
  final String amount;
  final String commission;
  final String product;
  final String revId;
  final String timePeriod;
  final String contactFio;
  final String contactPhone;
  final String whoIs;
  final String contactFio2;
  final String contactPhone2;
  final String whoIs2;
  final String job;
  final String jobPosition;
  final String averageIncome;


  CreditRequest({
      required this.amount,
      required this.commission,
      required this.product,
      required this.revId,
      required this.timePeriod,
      required this.contactFio,
      required this.contactPhone,
      required this.whoIs,
      required this.contactFio2,
      required this.contactPhone2,
      required this.whoIs2,
      required this.job,
      required this.jobPosition,
      required this.averageIncome
  });


  CreditRequest.empty({
      this.amount = '',
      this.commission = '',
      this.product = '',
      this.revId = '',
      this.timePeriod = '',
      this.contactFio = '',
      this.contactPhone = '',
      this.whoIs = '',
      this.contactFio2 = '',
      this.contactPhone2 = '',
      this.whoIs2 = '',
      this.job = '',
      this.jobPosition = '',
      this.averageIncome = '',
  });

  CreditRequest copyWith({
    String? amount,
    String? commission,
    String? product,
    String? revId,
    String? timePeriod,
    String? contactFio,
    String? contactPhone,
    String? whoIs,
    String? contactFio2,
    String? contactPhone2,
    String? whoIs2,
    String? job,
    String? jobPosition,
    String? averageIncome,
  }) {
    return CreditRequest(
      amount: amount ?? this.amount,
      commission: commission ?? this.commission,
      product: product ?? this.product,
      revId: revId ?? this.revId,
      timePeriod: timePeriod ?? this.timePeriod,
      contactFio: contactFio ?? this.contactFio,
      contactPhone: contactPhone ?? this.contactPhone,
      whoIs: whoIs ?? this.whoIs,
      contactFio2: contactFio2 ?? this.contactFio2,
      contactPhone2: contactPhone2 ?? this.contactPhone2,
      whoIs2: whoIs2 ?? this.whoIs2,
      job: job ?? this.job,
      jobPosition: jobPosition ?? this.jobPosition,
      averageIncome: averageIncome ?? this.averageIncome,
    );
  }

  factory CreditRequest.fromJson(Map<String, dynamic> json) =>
      _$CreditRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreditRequestToJson(this);
}
