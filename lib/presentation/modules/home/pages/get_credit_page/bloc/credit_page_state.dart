part of 'credit_page_cubit.dart';

class CreditStageData {
  final List<Credit>? credits;
  final Credit? selectedCredit;
  final double? chosenAmount;
  final double? chosenPeriod;
  final List<Commissions>? selectedCommission;
  final CreditRequest? creditRequest;

  CreditStageData({
    this.credits,
    this.selectedCredit,
    this.chosenAmount,
    this.chosenPeriod,
    this.selectedCommission,
    this.creditRequest,
  });

  CreditStageData copyWith({
    List<Credit>? credits,
    Credit? selectedCredit,
    double? chosenAmount,
    double? chosenPeriod,
    List<Commissions>? selectedCommission,
    CreditRequest? creditRequest,
  }) {
    return CreditStageData(
      credits: credits ?? this.credits,
      selectedCredit: selectedCredit ?? this.selectedCredit,
      chosenAmount: chosenAmount ?? this.chosenAmount,
      chosenPeriod: chosenPeriod ?? this.chosenPeriod,
      selectedCommission: selectedCommission ?? this.selectedCommission,
      creditRequest: creditRequest ?? this.creditRequest,
    );
  }
}

class CreditPageState {
  late final CreditStageData data;
  late final CreditEventState eventState;

  CreditPageState({
    required this.data,
    required this.eventState,
  });

  CreditPageState.initial() {
    data = CreditStageData();
    eventState = GetCreditInitial();
  }
}


abstract class CreditEventState {}

class GetCreditInitial extends CreditEventState {}

class LoadingCreditInfo extends CreditEventState {}

class LoadedCreditInfo extends CreditEventState {}

class SendCreditRequestState extends CreditEventState {}
