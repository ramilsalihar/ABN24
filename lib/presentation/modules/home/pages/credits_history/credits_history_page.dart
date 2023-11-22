import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/presentation/core/widgets/background_widget.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/widgets/income_repayment_body.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/widgets/status_request_body.dart';

const backgroundAsset = 'assets/background/credits_page.svg';

@RoutePage()
class CreditsHistoryPage extends StatefulWidget {
  const CreditsHistoryPage({super.key});

  @override
  State<CreditsHistoryPage> createState() => _CreditsHistoryPageState();
}

class _CreditsHistoryPageState extends State<CreditsHistoryPage> {
  final List<Widget> _pages = [
    const StatusRequestBody(),
    const IncomeRepaymentBody(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: AppScaffold(
        appBar: AppBar(
          title: Text(context.i10n.credit_history),
          bottom: TabBar(
            labelColor: Colors.white,
            dividerColor: Colors.white,
            tabs: [
              Tab(text: context.i10n.request_status),
              Tab(text: context.i10n.incoming_repayment),
            ],
          ),
        ),
        body: TabBarView(children: _pages,),
        background: const BackgroundWidget(
          asset: backgroundAsset,
          fit: BoxFit.cover,
        )
      ),
    );
  }
}
