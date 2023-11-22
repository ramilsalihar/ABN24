import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/presentation/core/widgets/buttons/app_info_button.dart';
import 'package:project_name/presentation/routes/app_router.gr.dart';

class InfoButtons extends StatelessWidget {
  const InfoButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5, left: 15, right: 15),
      child: SizedBox(
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: _infoButtons(context)
              .map(
                (e) => AppInfoButton(
                  title: e.title,
                  imagePath: e.asset,
                  onPressed: _navigateCallback(context, e.route),
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  VoidCallback _navigateCallback(BuildContext context, PageRouteInfo page) {
    return () => context.pushRoute(page);
  }

  List<InfoButtonParam> _infoButtons(BuildContext context) {
    return [
      InfoButtonParam(
        title: context.i10n.credits,
        asset: 'assets/icons/credit.svg',
        route: const CreditRoute(),
      ),
      InfoButtonParam(
        title: context.i10n.about_abn,
        asset: 'assets/icons/about_abn.svg',
        route: const AboutABNRoute(),
      ),
      InfoButtonParam(
        title: context.i10n.about_app,
        asset: 'assets/icons/about_app.svg',
        route: const AboutAppRoute(),
      ),
    ];
  }
}

class InfoButtonParam {
  final String title;
  final String asset;
  final PageRouteInfo route;

  InfoButtonParam({
    required this.title,
    required this.asset,
    required this.route,
  });
}
