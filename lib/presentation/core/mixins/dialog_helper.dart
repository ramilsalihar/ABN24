import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/i10n_context.dart';

mixin DialogHelper {
  Future<T?> showMessageDialog<T>({
    required BuildContext context,
    required String message,
    Key? key,
    List<Widget>? actions,
  }) {
    return showDialog(
      context: context,
      builder: (dCtx) {
        if (Platform.isIOS) {
          return CupertinoAlertDialog(
            key: key,
            content: Text(message),
            actions: actions ??
                [
                  TextButton(
                    onPressed: Navigator.of(dCtx).pop,
                    child: Text(dCtx.i10n.ok),
                  )
                ],
          );
        } else {
          return AlertDialog(
            key: key,
            alignment: Alignment.center,
            content: Text(message),
            actions: actions ??
                [
                  TextButton(
                    onPressed: Navigator.of(dCtx).pop,
                    child: Text(dCtx.i10n.ok),
                  )
                ],
          );
        }
      },
    );
  }
}
