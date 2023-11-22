import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../../../../../data/services/credit_service.dart';
import '../../../../../../domain/models/credit/credit.dart';
import '../../../../../../domain/models/credit/credit_request.dart';

part 'credit_page_state.dart';

class CreditPageCubit extends Cubit<CreditPageState> {
  CreditPageCubit() : super(CreditPageState.initial());

  final _creditService = CreditService(GetIt.I.get<Dio>());

  Future<void> getLoanProducts() async {
    final response = await _creditService.getLoanProducts();

    final credits =
        response.data.map<Credit>((credit) => Credit.fromJson(credit)).toList();

    emit(
      CreditPageState(
        data: state.data
            .copyWith(credits: credits, creditRequest: CreditRequest.empty()),
        eventState: LoadedCreditInfo(),
      ),
    );
  }

  Future<void> sendCreditRequest(CreditRequest creditRequest) async {
    await _creditService.sendCreditRequest(
      request: creditRequest,
    );

    emit(
      CreditPageState(
        data: state.data.copyWith(creditRequest: creditRequest),
        eventState: SendCreditRequestState(),
      ),
    );
  }

  void updateCreditRequest(CreditRequest creditRequest) {
    emit(
      CreditPageState(
        data: state.data.copyWith(creditRequest: creditRequest),
        eventState: LoadedCreditInfo(),
      ),
    );
  }

  void choseCredit(Credit selectedCredit) {
    emit(
      CreditPageState(
        data: state.data.copyWith(
            selectedCredit: selectedCredit,
            creditRequest: state.data.creditRequest!.copyWith(
                product: selectedCredit.name, revId: selectedCredit.rev_id)),
        eventState: LoadedCreditInfo(),
      ),
    );
  }

  void choseAmount(double amount) {
    emit(
      CreditPageState(
        data: state.data.copyWith(
            creditRequest:
                state.data.creditRequest!.copyWith(amount: amount.toString()),
            chosenAmount: amount),
        eventState: LoadedCreditInfo(),
      ),
    );
  }

  void chosePeriod(double period) {
    emit(
      CreditPageState(
        data: state.data.copyWith(
            creditRequest: state.data.creditRequest!
                .copyWith(timePeriod: period.toString()),
            chosenPeriod: period),
        eventState: LoadedCreditInfo(),
      ),
    );
  }

  void choseCommission(List<Commissions> commission) {
    emit(
      CreditPageState(
        data: state.data.copyWith(
            selectedCommission: commission,
            creditRequest: state.data.creditRequest!
                .copyWith(commission: commission.first.commission.toString())),
        eventState: LoadedCreditInfo(),
      ),
    );
  }
}
