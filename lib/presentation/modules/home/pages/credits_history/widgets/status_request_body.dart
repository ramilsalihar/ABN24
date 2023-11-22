import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/domain/models/credit/credit_status.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/bloc/credit_history_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/widgets/credit_status_card.dart';

class StatusRequestBody extends StatelessWidget {
  const StatusRequestBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreditHistoryCubit, CreditHistoryState>(
      builder: (context, state) {
        if (state.data.creditStatus == null) {
          BlocProvider.of<CreditHistoryCubit>(context).getCreditStatus();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        final creditStatusItems = state.data.creditStatus;

        return ListView.builder(
            itemCount: creditStatusItems!.length,
            itemBuilder: (ctx, index) {
              final item = creditStatusItems[index];
              return CreditStatusCard(
                startDate: item.start_date,
                endDate: item.end_date,
                status: item.status,
                issued: int.parse(item.issued),
                paidOff: int.parse(item.paid_of),
              );
            });
      },
    );
  }
}
