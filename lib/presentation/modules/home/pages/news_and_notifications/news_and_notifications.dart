import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/presentation/core/widgets/background_widget.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/widgets/chat_body.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/widgets/news_body.dart';
import '../../../../core/widgets/layout/app_scaffold.dart';

const List<Widget> _pages = [
  NewsBody(),
  ChatBody(),
];

@RoutePage()
class NewsAndNotificationsPage extends StatelessWidget {
  const NewsAndNotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: kToolbarHeight / 5,
            bottom: TabBar(
              labelColor: Colors.white,
              dividerColor: Colors.white,
              tabs: [
                Tab(text: context.i10n.news),
                Tab(text: context.i10n.reviews),
              ],
            ),
          ),
          body: const TabBarView(
            children: _pages,
          ),
        background: const BackgroundWidget(
          asset: 'assets/background/credits_page.svg',
        )
      ),
    );
  }
}
