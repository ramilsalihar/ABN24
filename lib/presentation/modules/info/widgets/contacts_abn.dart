import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/modules/info/info_cubit/info_cubit.dart';

const backgroundAsset = 'assets/background/about_abn.svg';

@RoutePage()
class ContactsAbn extends StatelessWidget {
  const ContactsAbn({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        title: Text(context.i10n.contacts),
      ),
      body: _body(context),
      background: SvgPicture.asset(
        backgroundAsset,
        fit: BoxFit.cover,
      ),
    );
  }
}

Widget _body(BuildContext context) {
  return BlocConsumer<InfoCubit, InfoState>(
    listener: (context, state) {
      BlocProvider.of<InfoCubit>(context).getContacts();
    },
    builder: (context, state) {
      if (state.eventState is InfoLoading) {
      } else if (state.eventState is InfoError) {
      } else {
        final item = state.data.contactData;
        return Padding(
            padding: EdgeInsets.all(context.dimens.paddingSmall),
            child: ListView.builder(
                itemCount: item.length,
                itemBuilder: (context, index) {
                  var contact = item[index];
                  var number = contact.childs;
                  return Container(
                      padding: EdgeInsets.all(context.dimens.paddingSmall),
                      decoration: BoxDecoration(
                          border: Border.all(),
                          color: Color(0xFF0E3311).withOpacity(0.01)),
                      child: Column(
                        children: [
                          Text(
                            contact.name,
                            style: TextStyle(fontSize: 18, color: Colors.green),
                          ).padding(
                              EdgeInsets.all(context.dimens.paddingSmall)),
                          ...number
                              .map(
                                (e) => Text('$e').padding(EdgeInsets.all(
                                    context.dimens.paddingSmall)),
                              )
                              .toList()
                        ],
                      ),
                    );
                }));
      }
      return const Center(
        child: Text('Error occurred'),
      );
    },
  );
}
