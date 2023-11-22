import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project_name/core/extensions/app_links_context.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:url_launcher/url_launcher.dart';

import 'abn_offices_page.dart';
import 'account_details_page.dart';
import 'info_cubit/info_cubit.dart';
import 'widgets/contacts_abn.dart';

@RoutePage()
class AboutABNPage extends StatefulWidget {
  const AboutABNPage({super.key});

  @override
  State<AboutABNPage> createState() => _AboutABNPageState();
}

class _AboutABNPageState extends State<AboutABNPage> {
  final backgroundAsset = 'assets/background/about_abn.svg';

  final logoAsset = 'assets/logo/logo_title.png';

  final introText = '«ОАО «МФК «АБН»\n'
      'является микрофинансовой компанией, работающая\n'
      'на рынке Кыргызской Республики более 20 лет.\n'
      'Основная миссия и цель АБН — предоставление\n'
      'доступных и удобных кредитов нашим клиентам.\n';

  final assetsPath = [
    'assets/icons/offices.svg',
    'assets/icons/contacts_icon.svg',
    'assets/icons/location_icon.svg',
    'assets/icons/help_icon.svg',
  ];

  final titleList = [
    'Офисы АБН',
    'Контакты АБН',
    'Центры и терминалы услуг',
    'Подробная информация',
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await BlocProvider.of<InfoCubit>(context).getAboutAbn();
      await BlocProvider.of<InfoCubit>(context).getContacts();
      await BlocProvider.of<InfoCubit>(context).getAccountDetails();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final pageNavigation = [
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ABNOffices()));
      },
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ContactsAbn()));
      },
      () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => AccountDetailsPage()));
      },
      () async {
        await launchUrl(context.appLinks.abnUri);
      },
    ];
    return AppScaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(logoAsset)
                  .padding(EdgeInsets.all(context.dimens.paddingMedium)),
              Text(introText)
                  .padding(EdgeInsets.all(context.dimens.paddingSmall)),
              const Divider(
                color: Colors.green,
                thickness: 1,
              ),
              _titleButton(assetsPath, titleList, pageNavigation),
              const Spacer(),
              Text(context.i10n.license)
                  .padding(EdgeInsets.all(context.dimens.paddingSmall)),
            ],
          ),
        ),
        background: SvgPicture.asset(
          backgroundAsset,
          fit: BoxFit.cover,
        ));
  }
}

Widget _titleButton(List<String> assetsPath, List<String> titleList,
    List<VoidCallback> pageNavigation) {
  return ListView(
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(
      assetsPath.length,
      (index) => InkWell(
        onTap: pageNavigation[index],
        child: ListTile(
          leading: SvgPicture.asset(assetsPath[index]),
          title: Text(titleList[index]),
        ),
      ),
    ),
  );
}
