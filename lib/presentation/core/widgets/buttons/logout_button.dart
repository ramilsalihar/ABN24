import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

class LogoutButton extends StatefulWidget {
  const LogoutButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  State<LogoutButton> createState() => _LogoutButtonState();
}

class _LogoutButtonState extends State<LogoutButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Theme.of(context).primaryColor,
        minimumSize: const Size.fromHeight(50),
      ),
      onPressed: widget.onPressed,
      child: Text(context.i10n.exit),
    ).padding(
      EdgeInsets.all(2 * context.dimens.paddingSmall),
    );
  }
}
