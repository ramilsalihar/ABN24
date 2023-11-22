import 'package:flutter/material.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  final void Function() onPressed;
  final String title;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            fixedSize: const Size.fromHeight(50),
            textStyle: Theme.of(context).textTheme.headlineMedium,
          ),
          child: Text(
            widget.title,
            style: Theme.of(context).textTheme.headlineMedium,
          ));
  }
}
