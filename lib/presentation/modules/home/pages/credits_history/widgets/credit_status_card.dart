import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

class CreditStatusCard extends StatelessWidget {
  const CreditStatusCard({
    super.key,
    required this.startDate,
    required this.endDate,
    required this.status,
    required this.issued,
    required this.paidOff,
  });

  final String startDate;
  final String endDate;
  final String status;
  final int issued;
  final int paidOff;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final percentage = paidOff / issued;
    final left = issued - paidOff;

    final theme = Theme.of(context).textTheme;

    return Container(
      padding: EdgeInsets.all(2 * context.dimens.paddingSmall),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.green),
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      height: width * 0.45,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: RichText(
              text: TextSpan(children: [
                TextSpan(
                  text: '$status\n\n',
                  style: theme.displayLarge!.copyWith(height: 1),
                ),
                TextSpan(
                    text: 'From $startDate to $endDate\n\n',
                    style: theme.headlineSmall!.copyWith(height: 1)),
                TextSpan(
                  text: '${context.i10n.given}: \n\n',
                  style: theme.headlineMedium!
                      .copyWith(color: Colors.black, height: 0.7),
                ),
                TextSpan(
                    text: '$issued \n\n',
                    style: theme.headlineSmall!
                        .copyWith(color: Colors.black, height: 0.6)),
                TextSpan(
                  text: '${context.i10n.remaining}: \n\n',
                  style: theme.headlineMedium!
                      .copyWith(color: Colors.black, height: 0.7),
                ),
                TextSpan(
                  text: left.toString(),
                  style: theme.headlineSmall!
                      .copyWith(color: Colors.black, height: 0.6),
                )
              ]),
            ).padding(EdgeInsets.only(
              left: context.dimens.paddingMedium,
            )),
          ),
          Expanded(
            flex: 2,
            child: CircularPercentIndicator(
              radius: width * 0.15,
              lineWidth: 15.0,
              percent: percentage,
              center: Text(
                '${(percentage * 100).toStringAsFixed(0)}%',
                style: theme.displayLarge,
              ),
              progressColor: Colors.green,
              backgroundColor: Colors.yellow,
            ),
          ),
        ],
      ),
    );
  }
}
