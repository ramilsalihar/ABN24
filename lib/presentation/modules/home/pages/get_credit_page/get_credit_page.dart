import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/widgets/page_content.dart';

import 'bloc/credit_page_cubit.dart';

@RoutePage()
class GetCreditPage extends StatefulWidget {
  const GetCreditPage({super.key});

  @override
  State<GetCreditPage> createState() => _GetCreditPageState();
}

class _GetCreditPageState extends State<GetCreditPage> {
  var backgroundAsset = 'assets/background/credits_page.svg';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<CreditPageCubit>(context).getLoanProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: const Text("Кредит"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(
              context.dimens.paddingSmall,
            ),
            child: const PageContent(),
          ),
        ),
      ),
      background: SvgPicture.asset(
        backgroundAsset,
        fit: BoxFit.cover,
      ),
    );
  }
}
