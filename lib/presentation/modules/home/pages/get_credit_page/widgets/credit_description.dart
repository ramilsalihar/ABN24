import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/presentation/core/sum_calculator.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/bloc/credit_page_cubit.dart';
import 'commission_box_info.dart';

class CreditDescription extends StatefulWidget {
  const CreditDescription({super.key});

  @override
  State<CreditDescription> createState() => _CreditDescriptionState();
}

class _CreditDescriptionState extends State<CreditDescription> {
  double totalSum = 0;
  int percentageRate = 0;
  int interestRate = 0;
  bool isMonthly = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreditPageCubit, CreditPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final commission = state.data.selectedCommission!.first.commission;
        final double amount = state.data.chosenAmount!;
        final double? period = state.data.chosenPeriod;

        SumCalculator sumCalculator;
        if(period != null) {
          sumCalculator = SumCalculator(
            period: period,
            amount: amount,
            type: state.data.selectedCredit!.sum.type,
          );

          totalSum = sumCalculator.totalSum;

          interestRate = sumCalculator.interest;
          percentageRate = sumCalculator.yearInterest;

          isMonthly = sumCalculator.isMonthly;
        }


        String textMonth = 'Ежемесячный платеж до конца срока кредита';
        String textEnd =
            'Погашение кредита производится в конце выбраного срока';

        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CommissionBoxInfo(
                  title: 'Коммиссия',
                  subtitle:
                      'Оплата коммиссии производится при получении кредита',
                  value: '$commission сом'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                      child: CommissionBoxInfo(
                          title: 'Процентная ставка в месяц:',
                          value: '${interestRate} %',
                          textStyle: TextStyle(fontSize: 12))),
                  Expanded(
                      child: CommissionBoxInfo(
                          title: 'Номинальная годовая процентная ставка:',
                          value: '$percentageRate %',
                          textStyle: TextStyle(fontSize: 12))),
                ],
              ),
              CommissionBoxInfo(
                  title: isMonthly ? textMonth : textEnd,
                  // subtitle: 'Оплата в конце срока',
                  value: '${totalSum.toStringAsFixed(2)} сом'),
              // ContactsField(),
            ],
          ),
        );
      },
    );
  }
}
