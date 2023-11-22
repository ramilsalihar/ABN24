import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

class IncomeRepaymentCard extends StatelessWidget {
  const IncomeRepaymentCard({
    Key? key,
    required this.loanNumber,
    required this.date,
    required this.sum,
    required this.percent,
    required this.fine,
    this.delay,
  }) : super(key: key);

  final String loanNumber;
  final String date;
  final int sum;
  final int percent;
  final int fine;
  final String? delay;

  @override
  Widget build(BuildContext context) {
    final overdue = delay != null;

    return Padding(
      padding: EdgeInsets.all(context.dimens.paddingMedium),
      child: SizedBox(
        height: 180,
        child: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '# $loanNumber',
                    style: const TextStyle(fontSize: 16),
                  ).padding(EdgeInsets.all(context.dimens.paddingSmall)),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(text: '$date\n\n'),
                              const TextSpan(
                                text: 'Кредит: ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              TextSpan(text: '$sum\n\n'),
                              TextSpan(
                                text:
                                    'Процент $percent\n\nПеня $fine\n\nИтого: ${sum + fine + percent}',
                                style: const TextStyle(
                                  fontSize: 16,
                                  height: 0.8,
                                ),
                              ),
                            ],
                          ),
                        ).padding(EdgeInsets.all(
                          context.dimens.paddingSmall,
                        ),
                      ),
                      if (overdue)
                        Text(
                          'просрочен на $delay дн., необходимо погасить',
                          style: const TextStyle(color: Colors.red),
                        ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
