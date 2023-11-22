import 'package:flutter/material.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/widgets/fields/passport_field.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/widgets/fields/passport_photo_field.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/widgets/fields/personal_data_field.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/widgets/fields/password_field.dart';
import 'fields/address_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DropDownUserInfo extends StatefulWidget {
  const DropDownUserInfo({super.key});

  @override
  State<DropDownUserInfo> createState() => _DropDownUserInfoState();
}

class _DropDownUserInfoState extends State<DropDownUserInfo> {
  int? _openIndex;

  void _toggleAdditionalInfo(int index) {
    setState(() {
      if (_openIndex == index) {
        _openIndex = null;
      } else {
        _openIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    final Map<String, Widget> items = {
      loc.photo_of_passport : const PassportPhotoField(),
      loc.password : const PasswordField(),
      loc.personal_data : const PersonalDataField(),
      loc.passport : const PassportField(),
      loc.address : const AddressField(),
    };

    return ListView.builder(
      primary: false,
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
                title: Text(items.keys.elementAt(index)),
                onTap: () {
                  _toggleAdditionalInfo(index);
                },
                trailing: _openIndex == index
                    ? const Icon(Icons.arrow_drop_up)
                    : const Icon(Icons.arrow_drop_down)),
            if (_openIndex == index) items.values.elementAt(index),
          ],
        );
      },
    );
  }
}
