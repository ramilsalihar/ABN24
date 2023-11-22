import 'package:flutter/material.dart';

class DropDownInfo extends StatefulWidget {
  const DropDownInfo({
    super.key,
    required this.name,
    required this.accounts,
  });

  final String name;
  final List<String> accounts;

  @override
  State<DropDownInfo> createState() => _DropDownInfoState();
}

class _DropDownInfoState extends State<DropDownInfo> {
  bool _showAdditionalInfo = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ListTile(
          title: Text(widget.name, style: TextStyle(fontSize: 18),),
          trailing: Icon(Icons.arrow_drop_down),
          onTap: () {
            setState(() {
              _showAdditionalInfo = !_showAdditionalInfo;
            });
          },
        ),
        if(_showAdditionalInfo) showDescription(widget.accounts),
        Divider(),
      ],
    );
    ;
  }
}

Widget showDescription(List<String> infoDetails) {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(), color: Color(0xFF0E3311).withOpacity(0.01)),
    child: Column(
      children: [
        ...infoDetails
            .map((e) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('$e'),
                ))
            .toList()
      ],
    ),
  );
}
