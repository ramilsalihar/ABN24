import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppInfoButton extends StatefulWidget {
  const AppInfoButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onPressed,
  });

  final String title;
  final String imagePath;
  final void Function() onPressed;

  @override
  State<AppInfoButton> createState() => _AppInfoButtonState();
}

class _AppInfoButtonState extends State<AppInfoButton> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: widget.onPressed,
        child: Column(
          children: [
            SvgPicture.asset(widget.imagePath),
            Padding(
              padding: const EdgeInsets.all(7.0),
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            )
          ],
        ));
  }
}
