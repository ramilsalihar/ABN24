import 'package:auto_route/auto_route.dart';
import 'package:project_name/presentation/modules/info/widgets/contacts_abn.dart';

import 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: LoginRoute.page, initial: true),
        AutoRoute(page: ProfileRoute.page),
        AutoRoute(page: GetCreditRoute.page),
        AutoRoute(page: ParametersAndConditionsRoute.page),
        AutoRoute(page: NewsAndNotificationsRoute.page),
        AutoRoute(page: CreditsHistoryRoute.page),
        AutoRoute(page: ContactsFieldRoute.page),
        AutoRoute(page: AgreementRoute.page),
        AutoRoute(page: AboutAppRoute.page),
        AutoRoute(page: AboutABNRoute.page),
        AutoRoute(page: OfficesLocationRoute.page),
        AutoRoute(page: CreditRoute.page),
        AutoRoute(page: ABNOffices.page),
      ];
}
