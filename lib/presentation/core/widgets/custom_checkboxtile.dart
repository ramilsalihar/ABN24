import 'package:flutter/material.dart';

class CustomCheckboxTile extends StatefulWidget {
  const CustomCheckboxTile({super.key});

  @override
  State<CustomCheckboxTile> createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile> {
  bool isChecked = false;
  bool _showValidation = false;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      width: 4 / 5 * width,
      child: Column(
        children: [
          CheckboxListTile(
            dense: false,
            value: isChecked,
            onChanged: (bool) {
              setState(() {
                isChecked = bool!;
                _showValidation = true;
              });
            },
            title: Text('Я ознакомлен и согласен', selectionColor: Colors.green,),
            controlAffinity: ListTileControlAffinity.leading,
          ),
        ],
      ),
    );
  }
}
