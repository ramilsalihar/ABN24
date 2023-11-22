import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:project_name/domain/models/credit/credit_status.dart';
import 'package:project_name/domain/models/credit/income_repayment.dart';

import '../../../../../../data/services/credit_service.dart';

part 'credit_history_state.dart';

class CreditHistoryCubit extends Cubit<CreditHistoryState> {
  CreditHistoryCubit() : super(CreditHistoryState.initial());

  final _creditService = CreditService(GetIt.I.get<Dio>());

  Future<void> getIncomeRepayment() async {
    emit(
      CreditHistoryState(
        data: state.data.copyWith(incomeRepayment: null),
        eventState: CreditHistoryLoading(),
      ),
    );

    try {
      final response = await _creditService.getRepayment();
      final incomeRepayment =
          response.data.map((e) => IncomeRepayment.fromJson(e)).toList();

      emit(
        CreditHistoryState(
          data: state.data.copyWith(incomeRepayment: incomeRepayment),
          eventState: CreditHistoryLoaded(),
        ),
      );
    } catch (error) {
      emit(
        CreditHistoryState(
          data: state.data.copyWith(incomeRepayment: null),
          eventState: CreditHistoryError(error.toString()),
        ),
      );
    }
  }

  Future<void> getCreditStatus() async {
    emit(
      CreditHistoryState(
        data: state.data.copyWith(creditStatus: null),
        eventState: CreditHistoryLoading(),
      ),
    );

    try {
      final response = await _creditService.getRequestsStatus();
      final creditStatus =
          response.data.map((e) => CreditStatus.fromJson(e)).toList();

      emit(
        CreditHistoryState(
          data: state.data.copyWith(creditStatus: creditStatus),
          eventState: CreditHistoryLoaded(),
        ),
      );
    } catch (error) {
      emit(
        CreditHistoryState(
          data: state.data.copyWith(creditStatus: null),
          eventState: CreditHistoryError(error.toString()),
        ),
      );
    }
  }
}
