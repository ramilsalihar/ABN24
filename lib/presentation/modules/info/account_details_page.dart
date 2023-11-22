import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/drop_down_info.dart';
import 'package:project_name/presentation/modules/info/info_cubit/info_cubit.dart';

import '../../core/widgets/layout/app_scaffold.dart';

const backgroundAsset = 'assets/background/about_abn.svg';

@RoutePage()
class AccountDetailsPage extends StatelessWidget {
  const AccountDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        appBar: AppBar(
          title: Text(context.i10n.details),
        ),
        body: _body(context),
        background: SvgPicture.asset(
          backgroundAsset,
          fit: BoxFit.cover,
        ));
  }
}


Widget _body(BuildContext context) {
  return BlocConsumer<InfoCubit, InfoState>(
      listener: (context, state) {
        BlocProvider.of<InfoCubit>(context).getAccountDetails();
      },
      builder: (context, state) {
        if (state.eventState is InfoLoading) {

        } else if (state.eventState is InfoError) {

        } else {
          final item = state.data.accountData;
          return ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    var contact = item[index];
                    return DropDownInfo(
                        name: contact.name,
                        accounts: contact.childs,
                      ).padding(EdgeInsets.all(context.dimens.paddingSmall));
                  });
        }
        return const Center(
          child: Text('Error occurred'),
        );
      });
}
