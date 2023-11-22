import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

class CommissionBoxInfo extends StatelessWidget {
  const CommissionBoxInfo({
    super.key,
    required this.title,
    required this.value,
    this.textStyle,
    this.subtitle,
  });

  final String title;
  final String value;
  final String? subtitle;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(context.dimens.paddingSmall),
          height: 90,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0.5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.all(context.dimens.paddingTiny),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: textStyle,
                      ),
                      Text(
                        subtitle ?? "",
                        style: textStyle,
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                Text(
                  value,
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),
    );
  }
}