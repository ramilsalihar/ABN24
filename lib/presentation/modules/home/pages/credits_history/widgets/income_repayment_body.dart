import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/bloc/credit_history_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/widgets/income_repayment_card.dart';

class IncomeRepaymentBody extends StatelessWidget {
  const IncomeRepaymentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditHistoryCubit, CreditHistoryState>(
      builder: (context, state) {
        if (state.data.incomeRepayment == null) {
          BlocProvider.of<CreditHistoryCubit>(context).getIncomeRepayment();
          return const Center(child: CircularProgressIndicator(),);
        }

        final incomeRepaymentItems = state.data.incomeRepayment;

        return ListView.builder(
          shrinkWrap: true,
          itemCount: incomeRepaymentItems!.length,
          itemBuilder: (ctx, index) {
            final item = incomeRepaymentItems[index];
            return IncomeRepaymentCard(
              loanNumber: item.loanNumber,
              date: item.date,
              sum: int.parse(item.sum),
              percent: int.parse(item.percent),
              fine: int.parse(item.fine),
              delay: item.delay,
            );
          },
        );
      },
    );
  }
}
