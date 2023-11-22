import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/domain/models/credit/credit_request.dart';
import 'package:project_name/presentation/core/widgets/custom_checkboxtile.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/credits_history_page.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/widgets/one_person_contact_field.dart';

import '../../../../core/widgets/layout/app_scaffold.dart';
import '../../../../core/widgets/register_field.dart';
import 'bloc/credit_page_cubit.dart';

@RoutePage()
class ContactsFieldPage extends StatefulWidget {
  const ContactsFieldPage({super.key});

  @override
  State<ContactsFieldPage> createState() => _ContactsFieldPageState();
}

class _ContactsFieldPageState extends State<ContactsFieldPage> {
  final contactFIO = TextEditingController();
  final contactPhone = TextEditingController();
  final whoIs = TextEditingController();
  final contactFIO2 = TextEditingController();
  final contactPhone2 = TextEditingController();
  final whoIs2 = TextEditingController();
  final averageSalary = TextEditingController();
  late CreditRequest? creditRequest;

  @override
  void initState() {
    creditRequest =
        BlocProvider.of<CreditPageCubit>(context).state.data.creditRequest;
    super.initState();
  }

  @override
  void dispose() {
    contactFIO.dispose();
    contactPhone.dispose();
    whoIs.dispose();
    contactFIO2.dispose();
    contactPhone2.dispose();
    whoIs2.dispose();
    averageSalary.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppScaffold(
        appBar: AppBar(
          title: const Text('Контактные данные'),
        ),
        body: Padding(
          padding: EdgeInsets.all(context.dimens.paddingSmall),
          child: BlocConsumer<CreditPageCubit, CreditPageState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              return ListView(
                children: [
                  OnePersonContactField(
                    title: 'Данные первого контактного лица',
                    controllers: [contactFIO, contactPhone, whoIs],
                  ),
                  OnePersonContactField(
                    title: 'Данные второго контактного лица',
                    controllers: [contactFIO2, contactPhone2, whoIs2],
                  ),
                  RegisterField(
                    hintText: 'Среднемесячный доход',
                    borderColor: Colors.black,
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                    controller: averageSalary,
                  ),
                  const CustomCheckboxTile(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF023621)),
                    onPressed: () {
                      creditRequest = creditRequest?.copyWith(
                          contactFio: contactFIO.text,
                          contactPhone: contactPhone.text,
                          whoIs: whoIs.text,
                          contactFio2: contactFIO2.text,
                          contactPhone2: contactPhone2.text,
                          whoIs2: whoIs2.text,
                          averageIncome: averageSalary.text);

                      BlocProvider.of<CreditPageCubit>(context)
                          .sendCreditRequest(
                        creditRequest!,
                      );
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const CreditsHistoryPage(),
                        ),
                      );
                    },
                    child: const Text('Получить кредит'),
                  )
                ],
              );
            },
          ),
        ),
        background: SvgPicture.asset(
          'assets/background/credits_page.svg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
