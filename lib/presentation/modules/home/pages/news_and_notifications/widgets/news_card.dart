import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

class NewsCard extends StatefulWidget {
  const NewsCard({
    super.key,
    required this.text,
    required this.date,
    required this.header,
  });

  final String text;
  final String date;
  final String header;
  final int maxLines = 50;

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.all(2 * context.dimens.paddingSmall),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                bottom: context.dimens.paddingMedium,
                top: context.dimens.paddingMedium,
              ),
              child: Row(
                children: [
                  Text(
                    widget.header,
                    style: theme.displayLarge,
                  ),
                  const Spacer(),
                  Text(
                    widget.date,
                    style: theme.headlineMedium!.copyWith(
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.text,
              maxLines: isExpanded ? widget.maxLines : null,
              overflow: TextOverflow.ellipsis,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? context.i10n.read_less : context.i10n.read_more,
                  style: const TextStyle(color: Colors.blue),
                ),
              ),
            ),
            const Divider(
              thickness: 1,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
