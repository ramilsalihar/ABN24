import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/modules/info/info_cubit/info_cubit.dart';

const String description = '';

@RoutePage()
class ParametersAndConditionsPage extends StatelessWidget {
  const ParametersAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final info = BlocProvider.of<InfoCubit>(context).state.data.creditData;

    final text1 = info[0];
    final text2 = info[1];

    return Scaffold(
      appBar: AppBar(
        title: Text('Параметры и Условия'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text('Long Text'),
              Text(
                'Параметры и условия кредитных продуктов:',
                style: Theme.of(context).textTheme.headlineLarge,
              ).padding(
                EdgeInsets.all(context.dimens.paddingSmall),
              ),
              Text(
                text1.title,
              ).padding(EdgeInsets.all(context.dimens.paddingSmall)),
              Html(
                data: text1.description,
              ),
              Text(text2.title),
              Html(
                data: text2.description,
              )
            ],
          ),
        ),
      ),
    );
  }
}
