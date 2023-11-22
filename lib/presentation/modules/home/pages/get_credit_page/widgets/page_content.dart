import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/widgets/sliders_for_credit.dart';
import 'package:project_name/presentation/routes/app_router.gr.dart';

import '../../../../../../domain/models/credit/credit.dart';
import '../../../../../core/widgets/drop_down_field.dart';
import '../bloc/credit_page_cubit.dart';
import 'credit_description.dart';

class PageContent extends StatefulWidget {
  const PageContent({super.key});

  @override
  State<PageContent> createState() => _PageContentState();
}

class _PageContentState extends State<PageContent> {
  @override
  Widget build(BuildContext context) {
    String hintText = 'Выберите кредит';
    return FutureBuilder(
      future: BlocProvider.of<CreditPageCubit>(context).getLoanProducts(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        return BlocConsumer<CreditPageCubit, CreditPageState>(
          listener: _creditBlocListener,
          builder: (context, state) {
            if (state.eventState is LoadingCreditInfo) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state.eventState is LoadedCreditInfo) {
              var items = state.data.credits?.map((e) => e.name).toList();
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DropDownField<Credit>(
                    hintText: hintText,
                    updateData: (value) {
                      setState(() {
                        BlocProvider.of<CreditPageCubit>(context).choseCredit(
                          value,
                        );
                      });
                    },
                    itemWidgets: items!
                        .map(
                          (e) => DropdownMenuItem<String>(
                              value: e, child: Text(e)),
                        )
                        .toList(),
                    valueToString: (Credit value) {
                      return value.name;
                    },
                    stringToValue: (String value) {
                      return state.data.credits!.firstWhere(
                        (element) => element.name == value,
                      );
                    },
                  ),
                  state.data.selectedCredit == null
                      ? const SizedBox()
                      : SlidersForCredit(
                          selectedCredit: state.data.selectedCredit!,
                        ),
                  state.data.selectedCommission != null
                      ? const CreditDescription()
                      : const SizedBox(),
                  state.data.selectedCommission != null
                      ? SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () => context.router.push(
                              const ContactsFieldRoute(),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            child: const Text('Продолжить'),
                          ),
                        )
                      : const SizedBox(),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        );
      },
    );
  }

  void _creditBlocListener(BuildContext context, CreditPageState state) {
    var eState = state.eventState;
    if (eState is LoadingCreditInfo) {
      EasyLoading.show(status: context.i10n.loading);
    } else {
      EasyLoading.dismiss();
    }
  }
}
