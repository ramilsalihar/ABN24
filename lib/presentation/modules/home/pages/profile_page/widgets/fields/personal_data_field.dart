import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import '../../../../../../../domain/models/all_list/list_model.dart';
import '../../../../../../core/validation/form_validation.dart';
import '../../../../../../core/widgets/drop_down_field.dart';
import '../../../../../../core/widgets/radio_field.dart';
import '../../../../../../core/widgets/register_field.dart';
import '../../cubit/profile_page_cubit.dart';
import '../../cubit/profile_page_state.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PersonalDataField extends StatefulWidget {
  const PersonalDataField({super.key});

  @override
  State<PersonalDataField> createState() => _PersonalDataFieldState();
}

class _PersonalDataFieldState extends State<PersonalDataField> {

  @override
  Widget build(BuildContext context) {
    final surnameController = TextEditingController();
    final nameController = TextEditingController();
    final secondName = TextEditingController();
    final formValidation = FormValidation(context);
    bool statusLoaded = false;

    String hintLastname = context.i10n.surname;
    String hintName = context.i10n.name;
    String hintSecondName = context.i10n.patronymic;
    String hintMaritalStatus = context.i10n.select_marital_status;
    String hintBirthDate = '11 Апреля 1987';

    return FutureBuilder(
      future: BlocProvider.of<ProfilePageCubit>(context).getMaritalStatus('M'),
      builder:(ctx, snapshot) =>  BlocConsumer<ProfilePageCubit, ProfilePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          String? lastNameState = state.data.userData!.last_name;
          hintLastname = lastNameState == '' ? hintLastname : lastNameState;
          String? nameState = state.data.userData!.first_name;
          hintName = nameState == '' ? hintName : nameState;
          String? secondNameState = state.data.userData!.second_name;
          hintSecondName = secondNameState == '' ? hintSecondName : secondNameState;
          String? maritalStatusState = state.data.userData!.marital_status;
          hintMaritalStatus = maritalStatusState == '' ? hintMaritalStatus : maritalStatusState;
          String? birthDateState = state.data.userData!.birth_date;
          hintBirthDate = birthDateState == '' ? hintBirthDate : birthDateState;

          String selectedValue = state.data.selectedStatus ?? '';
          List<String> options = ['M', 'F'];

          void onGenderChanged(String value) {
            setState(() {
              selectedValue = value;
              BlocProvider.of<ProfilePageCubit>(context).getMaritalStatus(selectedValue);
            });
          }

          if(state.data.status != null) {
            statusLoaded = true;
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              RegisterField(
                hintText: hintLastname,
                borderColor: Colors.green,
                keyboardType: TextInputType.text,
                controller: surnameController,
                validateMode: true,
                validator: (_) =>
                    formValidation.validateCyrillic(surnameController.text),
              ),
              RegisterField(
                hintText: hintName,
                borderColor: Colors.green,
                keyboardType: TextInputType.text,
                controller: nameController,
                validateMode: true,
                validator: (_) =>
                    formValidation.validateCyrillic(nameController.text),
              ),
              RegisterField(
                hintText: hintSecondName,
                borderColor: Colors.green,
                keyboardType: TextInputType.text,
                controller: secondName,
                validateMode: true,
                validator: (_) =>
                    formValidation.validateCyrillic(secondName.text),
              ),
              RadioField(
                selectedValue: selectedValue,
                options: options,
                onChanged: onGenderChanged,
              ),
              statusLoaded ? DropDownField<MaritalStatus>(
                hintText: hintMaritalStatus,
                updateData: (MaritalStatus value) {
                  BlocProvider.of<ProfilePageCubit>(context)
                      .updateStateData(maritalStatus: value.name);
                },
                itemWidgets: state.data.status!
                    .map((e) =>
                    DropdownMenuItem<String>(
                      value: e.name,
                      child: Text(e.name),
                    ))
                    .toList(),
                valueToString: (MaritalStatus value) {
                  return value.name;
                },
                stringToValue: (String value) {
                  return state.data.status!.firstWhere((element) => element.name == value);
                },
              ) : const SizedBox(),
              RegisterField(
                hintText: hintBirthDate,
                borderColor: Colors.green,
                keyboardType: TextInputType.text,
                controller: secondName,
              ),
            ],
          );
        },
      ),
    );
  }
}
