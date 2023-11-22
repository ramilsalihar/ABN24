import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';

@RoutePage()
class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  final Map<String, String> _icons = const {
    'assets/icons/info_card.svg': 'More data',
    'assets/icons/contact_phone.svg': 'More data',
    'assets/icons/loan.svg': 'More data',
  };

  @override
  Widget build(BuildContext context) {
    //TODO: Update this page
    return AppScaffold(
        appBar: AppBar(
          title: Text('About App'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Text(
              'Быстро Удобно Доступно',
              textAlign: TextAlign.center,
            ).padding(
              EdgeInsets.all(context.dimens.paddingSmall),
            ),
            Text(
              'Some description',
              textAlign: TextAlign.center,
            ).padding(
              EdgeInsets.all(context.dimens.paddingSmall),
            ),
            Divider(),
            Expanded(child: _body(context, _icons)),
          ],
        ),
        background: SvgPicture.asset(
          'assets/background/about_abn.svg',
          fit: BoxFit.cover,
        ));
  }
}

Widget _body(BuildContext context, Map<String, String> items) {
  return ListView.builder(
    itemCount: items.values.length,
    itemBuilder: (context, index) {
      final path = items.keys.elementAt(index);
      final title = items.values.elementAt(index);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(path),
          Text(
            title,
            textAlign: TextAlign.center,
          ),
        ],
      ).padding(
        EdgeInsets.all(context.dimens.paddingSmall),
      );
    },
  );
}
