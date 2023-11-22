import 'package:flutter/material.dart';

class DropDownField<T> extends StatefulWidget {
  const DropDownField({
    Key? key,
    this.hintText = '',
    required this.updateData,
    required this.itemWidgets,
    required this.valueToString,
    required this.stringToValue,
  }) : super(key: key);

  final String hintText;
  final void Function(T)? updateData;
  final List<DropdownMenuItem<String>> itemWidgets;
  final String Function(T) valueToString;
  final T Function(String) stringToValue;

  @override
  _DropDownFieldState createState() => _DropDownFieldState<T>();
}

class _DropDownFieldState<T> extends State<DropDownField<T>> {
  late TextEditingController updatedItem;

  @override
  void initState() {
    super.initState();
    updatedItem = TextEditingController();
  }

  @override
  void dispose() {
    updatedItem.dispose();
    widget.itemWidgets.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 4 / 5 * width,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            value: updatedItem.text.isEmpty ? null : updatedItem.text,
            onChanged: (String? value) {
              final selectedObject = widget.stringToValue(value!);
              setState(() {
                updatedItem.text = widget.valueToString(selectedObject);
                widget.updateData?.call(selectedObject);
              });
            },
            items: widget.itemWidgets,
            hint: Text(
              updatedItem.text.isEmpty ? widget.hintText : updatedItem.text,
            ),
            underline: Container(),
            isExpanded: true,
          ),
        ),
      ),
    );
  }
}
