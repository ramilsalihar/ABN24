import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/cubit/profile_page_cubit.dart';
import '../../../domain/models/user.dart';

enum Gender { male, female }

Gender selectedGender = Gender.male;

class RadioField extends StatefulWidget {
  const RadioField({
    super.key,
    required this.options,
    required this.selectedValue,
    required this.onChanged,
  });

  final List<String> options;
  final String selectedValue;
  final void Function(String) onChanged;

  @override
  State<RadioField> createState() => _RadioFieldState();
}

class _RadioFieldState extends State<RadioField> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
        width: 4 / 5 * width,
        child: Row(
          children: widget.options.map((option) {
            return Expanded(
              child: RadioListTile<String>(
                title: Text(option),
                value: option,
                groupValue: widget.selectedValue,
                onChanged: (value) {
                  widget.onChanged(value!);
                },
              ),
            );
          }).toList(),
        ));
  }
}

/*
* Expanded(
              child: RadioListTile(
                title: Text(widget.options[1]),
                value: widget.selectedValue,
                groupValue: widget.options,
                onChanged: (value) {
                  setState(() {
                    widget.onChanged!(value!);
                  });
                }),
              ),*/
