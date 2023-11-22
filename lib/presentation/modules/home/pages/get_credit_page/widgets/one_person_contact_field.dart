import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import '../../../../../core/widgets/register_field.dart';

class OnePersonContactField extends StatefulWidget {
  const OnePersonContactField({
    super.key,
    required this.title,
    required this.controllers,
  });

  final String title;
  final List<TextEditingController> controllers;

  @override
  State<OnePersonContactField> createState() => _OnePersonContactFieldState();
}

class _OnePersonContactFieldState extends State<OnePersonContactField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(context.dimens.paddingMedium),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
        RegisterField(
          hintText: 'Введите ФИО',
          borderColor: Colors.black,
          keyboardType: TextInputType.text,
          controller: widget.controllers[0],
        ),
        RegisterField(
          hintText: '+996',
          borderColor: Colors.black,
          keyboardType: TextInputType.number,
          controller: widget.controllers[1],
          // trailingIcon: true,
        ),
        RegisterField(
          hintText: 'Кем приходится',
          borderColor: Colors.black,
          keyboardType: TextInputType.text,
          controller: widget.controllers[2],
        ),
      ],
    );
  }
}
