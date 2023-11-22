import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/theme/colors/app_colors.dart';
import 'package:project_name/presentation/core/widgets/background_widget.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/cubit/notifications_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/cubit/profile_page_cubit.dart';
import 'package:project_name/presentation/modules/home/widgets/app_drawer.dart';

import '../../core/widgets/home_card.dart';
import '../../routes/app_router.gr.dart';

const _backgroundAsset = 'assets/background/home_page.svg';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ProfilePageCubit>().getProfileData();
      await context.read<NotificationsCubit>().getNews();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      background: const BackgroundWidget(
        asset: _backgroundAsset,
      ),
      appBar: AppBar(
        title: const Text("АБН"),
        automaticallyImplyLeading: false,
        actions: [
          Builder(
            builder: (context) => IconButton(
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                icon: const Icon(Icons.perm_identity_rounded)),
          )
        ],
      ),
      bottom: _bottomText(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemCount: gridItems().length,
          itemBuilder: (context, index) {
            final gridItems = this.gridItems();
            final gridItem = gridItems[index];
            return InkWell(
              onTap: gridItem.nextPage,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                    color: Colors.white),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(gridItem.iconPath),
                    Text(gridItem.title).padding(
                      EdgeInsets.only(top: context.dimens.paddingTiny),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      drawer: const AppDrawer(),
    );
  }

  List<HomeCard> gridItems() {
    return [
      HomeCard(
          title: "Получить кредит",
          iconPath: 'assets/icons/get_credit.svg',
          nextPage: () => context.router.push(const GetCreditRoute())),
      HomeCard(
        title: "Кредитная История",
        iconPath: 'assets/icons/credit_history.svg',
        nextPage: () => context.router.push(const CreditsHistoryRoute()),
      ),
      HomeCard(
        title: "Параметры и Условия",
        iconPath: 'assets/icons/parameters_conditions.svg',
        nextPage: () =>
            context.router.push(const ParametersAndConditionsRoute()),
      ),
      HomeCard(
        title: "Новости и Уведомления",
        iconPath: 'assets/icons/news_notifications.svg',
        nextPage: () => context.router.push(const NewsAndNotificationsRoute()),
      )
    ];
  }

  Widget _bottomText() {
    return Text(
      context.i10n.license,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: AppColors.of(context).white,
          ),
    ).padding(
      EdgeInsets.all(context.dimens.paddingSmall).copyWith(
        bottom: context.dimens.paddingLarge,
      ),
    );
  }
}
