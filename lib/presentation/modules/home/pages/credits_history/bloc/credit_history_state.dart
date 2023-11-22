part of 'credit_history_cubit.dart';

class CreditHistoryData {
  List<IncomeRepayment>? incomeRepayment;
  List<CreditStatus>? creditStatus;

  CreditHistoryData({
    this.incomeRepayment,
    this.creditStatus,
  });

  CreditHistoryData copyWith({
    List<IncomeRepayment>? incomeRepayment,
    List<CreditStatus>? creditStatus,
  }) {
    return CreditHistoryData(
      incomeRepayment: incomeRepayment ?? this.incomeRepayment,
      creditStatus: creditStatus ?? this.creditStatus,
    );
  }
}

@immutable
class CreditHistoryState {
  late final CreditHistoryData data;
  late final CreditHistoryEvent eventState;

  CreditHistoryState({
    required this.data,
    required this.eventState,
  });

  CreditHistoryState.initial() {
    data = CreditHistoryData();
    eventState = CreditHistoryInitial();
  }
}

@immutable
abstract class CreditHistoryEvent {}

class CreditHistoryInitial extends CreditHistoryEvent {}

class CreditHistoryLoading extends CreditHistoryEvent {}

class CreditHistoryLoaded extends CreditHistoryEvent {}

class CreditHistoryError extends CreditHistoryEvent {
  final String error;

  CreditHistoryError(this.error);
}
