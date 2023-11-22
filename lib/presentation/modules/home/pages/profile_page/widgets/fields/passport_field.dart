import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/presentation/core/widgets/radio_field.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/cubit/profile_page_cubit.dart';

import '../../../../../../core/widgets/register_field.dart';
import '../../cubit/profile_page_state.dart';

class PassportField extends StatefulWidget {
  const PassportField({super.key});

  @override
  State<PassportField> createState() => _PassportFieldState();
}

class _PassportFieldState extends State<PassportField> {
  @override
  Widget build(BuildContext context) {
    final dataIssueController = TextEditingController();
    final placeIssuedController = TextEditingController();
    final numberIssuedController = TextEditingController();

    String hintDataIssue = '22 Март 2010';
    String hintPlaceIssued = 'МКК 234';
    String hintNumberIssued = '1234567';

    return BlocConsumer<ProfilePageCubit, ProfilePageState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        String? dataIssueState = state.data.userData!.passport.id_doc_date;
        hintDataIssue = dataIssueState == '' ? hintDataIssue : dataIssueState;
        String? placeIssuedState = state.data.userData!.passport.id_doc_info;
        hintPlaceIssued =
            placeIssuedState == '' ? hintPlaceIssued : placeIssuedState;
        String? numberIssuedState = state.data.userData!.passport.id_doc_no;
        hintNumberIssued =
            hintNumberIssued == '' ? hintNumberIssued : numberIssuedState;

        String selectedValue = state.data.selectedStatus ?? '';
        List<String> options = ['ID', 'AN'];
        void onTypeChanged(String value) {
          setState(() {
            selectedValue = value;
            // BlocProvider.of<ProfilePageCubit>(context)
            //     .updateStateData(idDocSer: selectedValue);
            BlocProvider.of<ProfilePageCubit>(context)
                .selectedType(selectedValue);
          });
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Flexible(
                    flex: 5,
                    child: RadioField(
                        options: options,
                        selectedValue: selectedValue,
                        onChanged: onTypeChanged)),
                Flexible(
                  flex: 3,
                  child: SizedBox(
                    height: 60,
                    width: 200,
                    child: RegisterField(
                      hintText: hintNumberIssued,
                      borderColor: Colors.green,
                      keyboardType: TextInputType.text,
                      controller: numberIssuedController,
                      onCompleted: () =>
                          BlocProvider.of<ProfilePageCubit>(context)
                              .updateStateData(
                                  idDocNo: numberIssuedController.text),
                    ),
                  ),
                ),
              ],
            ),
            RegisterField(
              hintText: hintDataIssue,
              borderColor: Colors.green,
              keyboardType: TextInputType.text,
              controller: dataIssueController,
              onCompleted: () =>
                BlocProvider.of<ProfilePageCubit>(context)
                    .updateStateData(idDocDate: dataIssueController.text),
            ),
            RegisterField(
              hintText: hintPlaceIssued,
              borderColor: Colors.green,
              keyboardType: TextInputType.text,
              controller: placeIssuedController,
              onCompleted: () =>
                BlocProvider.of<ProfilePageCubit>(context)
                    .updateStateData(idDocInfo: placeIssuedController.text),
            ),
          ],
        );
      },
    );
  }
}
