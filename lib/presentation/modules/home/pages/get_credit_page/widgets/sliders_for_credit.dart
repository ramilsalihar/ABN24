import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/domain/models/credit/credit.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/bloc/credit_page_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/widgets/circular_slider_with_title.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/widgets/slider_with_title.dart';

class SlidersForCredit extends StatefulWidget {
  const SlidersForCredit({super.key, required this.selectedCredit});

  final Credit selectedCredit;

  @override
  State<SlidersForCredit> createState() => _SlidersForCreditState();
}

class _SlidersForCreditState extends State<SlidersForCredit> {
  double chosenAmount = 0.0;
  final String titleAmount = 'Сумма';

  double findNearestValue(double value, List<double> intervals) {
    double minDistance = double.maxFinite;
    double nearestValue = intervals.first;

    for (final validValue in intervals) {
      final distance = (validValue - value).abs();
      if (distance < minDistance) {
        minDistance = distance;
        nearestValue = validValue;
      }
    }

    return nearestValue;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreditPageCubit, CreditPageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        final type = state.data.selectedCredit?.sum.type;
        String titlePeriod = type == 'D' ? 'Срок в Днях' : 'Срок в Месяцах';

        final minAmountState = widget.selectedCredit.sum.details.first.value;
        final maxAmountState = widget.selectedCredit.sum.details.last.value;
        final double minAmount = minAmountState.toDouble();
        final double maxAmount = maxAmountState.toDouble();

        final minPeriod = double.parse(
            widget.selectedCredit.sum.details.first.commissions.first.time);

        var chosenAmount = state.data.chosenAmount ?? minAmount;
        var chosenPeriod = state.data.chosenPeriod ?? minPeriod;

        List<Commissions> selectedCommission = [];

        for (var commission in widget.selectedCredit.sum.details) {
          var value = commission.value.toDouble();
          var commissionList = commission.commissions;

          if (value <= chosenAmount) {
            selectedCommission = commissionList;
          }
        }

        if(chosenPeriod > double.parse(selectedCommission.last.time)){
          chosenPeriod = double.parse(selectedCommission.last.time);
        }

        final maxPeriod = double.parse(selectedCommission.last.time);

        List<double> amountIntervals = widget.selectedCredit.sum.details.map((e) => e.value.toDouble()).toList();

        List<double> periodIntervals =
        selectedCommission.map((e) => double.parse(e.time)).toList();


        return Column(
          children: [
            CircularSliderWithTitle(
              minAmount: minAmount,
              maxAmount: maxAmount,
              intervals: amountIntervals,
              value: chosenAmount,
              onChosenValueChanged: (value){
                setState(() {
                  chosenAmount = findNearestValue(value, amountIntervals);
                  BlocProvider.of<CreditPageCubit>(context)
                      .choseAmount(chosenAmount);
                  BlocProvider.of<CreditPageCubit>(context).choseCommission(
                      selectedCommission);
                  print('amount: $chosenAmount');
                });
              },),
            SliderWithTitle(
              title: titlePeriod,
              min: minPeriod,
              max: maxPeriod,
              intervals: periodIntervals,
              chosenValue: chosenPeriod,
              onChosenValueChanged: (value) {
                setState(() {
                  BlocProvider.of<CreditPageCubit>(context)
                      .chosePeriod(findNearestValue(value, periodIntervals));
                  print('period: $value');
                });
              },
            ),
          ],
        );
      },
    );
  }
}

