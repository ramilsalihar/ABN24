import 'package:flutter/material.dart';

class RegisterButton extends StatefulWidget {
  const RegisterButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  final title;
  final VoidCallback onTap;

  @override
  State<RegisterButton> createState() => _RegisterButtonState();
}

class _RegisterButtonState extends State<RegisterButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 3),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            height: 50,
            child: Center(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            )),
      ),
    );
  }
}
