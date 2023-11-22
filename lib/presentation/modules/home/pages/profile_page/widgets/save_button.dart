import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

class SaveButton extends StatefulWidget {
  const SaveButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return Container(
        padding: EdgeInsets.all(context.dimens.paddingMedium),
          decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          width: 200,
          margin: EdgeInsets.only(bottom: 2 * context.dimens.paddingSmall),
          child: TextButton(
            onPressed: widget.onPressed,
            child: Text(loc.save),
          ));
  }
}
