// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/material.dart' as _i17;
import 'package:project_name/domain/models/info/info_model.dart' as _i18;
import 'package:project_name/presentation/modules/auth/login_page.dart' as _i11;
import 'package:project_name/presentation/modules/home/home_page.dart' as _i10;
import 'package:project_name/presentation/modules/home/pages/credits_history/credits_history_page.dart'
    as _i8;
import 'package:project_name/presentation/modules/home/pages/get_credit_page/contacts_field.dart'
    as _i6;
import 'package:project_name/presentation/modules/home/pages/get_credit_page/get_credit_page.dart'
    as _i9;
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/news_and_notifications.dart'
    as _i12;
import 'package:project_name/presentation/modules/home/pages/parameters_conditions/paramaters_conditions.dart'
    as _i14;
import 'package:project_name/presentation/modules/home/pages/profile_page/profile_page.dart'
    as _i15;
import 'package:project_name/presentation/modules/info/abn_offices_page.dart'
    as _i1;
import 'package:project_name/presentation/modules/info/about_abn_page.dart'
    as _i2;
import 'package:project_name/presentation/modules/info/about_app_page.dart'
    as _i3;
import 'package:project_name/presentation/modules/info/account_details_page.dart'
    as _i4;
import 'package:project_name/presentation/modules/info/agreement_page.dart'
    as _i5;
import 'package:project_name/presentation/modules/info/credit_info_page.dart'
    as _i7;
import 'package:project_name/presentation/modules/info/offices_location_page.dart'
    as _i13;

abstract class $AppRouter extends _i16.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    ABNOffices.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.ABNOffices(),
      );
    },
    AboutABNRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.AboutABNPage(),
      );
    },
    AboutAppRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.AboutAppPage(),
      );
    },
    AccountDetailsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.AccountDetailsPage(),
      );
    },
    AgreementRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.AgreementPage(),
      );
    },
    ContactsFieldRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.ContactsFieldPage(),
      );
    },
    CreditRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.CreditPage(),
      );
    },
    CreditsHistoryRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.CreditsHistoryPage(),
      );
    },
    GetCreditRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.GetCreditPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i11.LoginPage(),
      );
    },
    NewsAndNotificationsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i12.NewsAndNotificationsPage(),
      );
    },
    OfficesLocationRoute.name: (routeData) {
      final args = routeData.argsAs<OfficesLocationRouteArgs>();
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i13.OfficesLocationPage(
          key: args.key,
          title: args.title,
          offices: args.offices,
        ),
      );
    },
    ParametersAndConditionsRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i14.ParametersAndConditionsPage(),
      );
    },
    ProfileRoute.name: (routeData) {
      return _i16.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i15.ProfilePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.ABNOffices]
class ABNOffices extends _i16.PageRouteInfo<void> {
  const ABNOffices({List<_i16.PageRouteInfo>? children})
      : super(
          ABNOffices.name,
          initialChildren: children,
        );

  static const String name = 'ABNOffices';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i2.AboutABNPage]
class AboutABNRoute extends _i16.PageRouteInfo<void> {
  const AboutABNRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AboutABNRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutABNRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i3.AboutAppPage]
class AboutAppRoute extends _i16.PageRouteInfo<void> {
  const AboutAppRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AboutAppRoute.name,
          initialChildren: children,
        );

  static const String name = 'AboutAppRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i4.AccountDetailsPage]
class AccountDetailsRoute extends _i16.PageRouteInfo<void> {
  const AccountDetailsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AccountDetailsRoute.name,
          initialChildren: children,
        );

  static const String name = 'AccountDetailsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i5.AgreementPage]
class AgreementRoute extends _i16.PageRouteInfo<void> {
  const AgreementRoute({List<_i16.PageRouteInfo>? children})
      : super(
          AgreementRoute.name,
          initialChildren: children,
        );

  static const String name = 'AgreementRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i6.ContactsFieldPage]
class ContactsFieldRoute extends _i16.PageRouteInfo<void> {
  const ContactsFieldRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ContactsFieldRoute.name,
          initialChildren: children,
        );

  static const String name = 'ContactsFieldRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i7.CreditPage]
class CreditRoute extends _i16.PageRouteInfo<void> {
  const CreditRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CreditRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreditRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i8.CreditsHistoryPage]
class CreditsHistoryRoute extends _i16.PageRouteInfo<void> {
  const CreditsHistoryRoute({List<_i16.PageRouteInfo>? children})
      : super(
          CreditsHistoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreditsHistoryRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i9.GetCreditPage]
class GetCreditRoute extends _i16.PageRouteInfo<void> {
  const GetCreditRoute({List<_i16.PageRouteInfo>? children})
      : super(
          GetCreditRoute.name,
          initialChildren: children,
        );

  static const String name = 'GetCreditRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i10.HomePage]
class HomeRoute extends _i16.PageRouteInfo<void> {
  const HomeRoute({List<_i16.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i11.LoginPage]
class LoginRoute extends _i16.PageRouteInfo<void> {
  const LoginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i12.NewsAndNotificationsPage]
class NewsAndNotificationsRoute extends _i16.PageRouteInfo<void> {
  const NewsAndNotificationsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          NewsAndNotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsAndNotificationsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i13.OfficesLocationPage]
class OfficesLocationRoute
    extends _i16.PageRouteInfo<OfficesLocationRouteArgs> {
  OfficesLocationRoute({
    _i17.Key? key,
    required String title,
    required List<_i18.LocationChild> offices,
    List<_i16.PageRouteInfo>? children,
  }) : super(
          OfficesLocationRoute.name,
          args: OfficesLocationRouteArgs(
            key: key,
            title: title,
            offices: offices,
          ),
          initialChildren: children,
        );

  static const String name = 'OfficesLocationRoute';

  static const _i16.PageInfo<OfficesLocationRouteArgs> page =
      _i16.PageInfo<OfficesLocationRouteArgs>(name);
}

class OfficesLocationRouteArgs {
  const OfficesLocationRouteArgs({
    this.key,
    required this.title,
    required this.offices,
  });

  final _i17.Key? key;

  final String title;

  final List<_i18.LocationChild> offices;

  @override
  String toString() {
    return 'OfficesLocationRouteArgs{key: $key, title: $title, offices: $offices}';
  }
}

/// generated route for
/// [_i14.ParametersAndConditionsPage]
class ParametersAndConditionsRoute extends _i16.PageRouteInfo<void> {
  const ParametersAndConditionsRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ParametersAndConditionsRoute.name,
          initialChildren: children,
        );

  static const String name = 'ParametersAndConditionsRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}

/// generated route for
/// [_i15.ProfilePage]
class ProfileRoute extends _i16.PageRouteInfo<void> {
  const ProfileRoute({List<_i16.PageRouteInfo>? children})
      : super(
          ProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProfileRoute';

  static const _i16.PageInfo<void> page = _i16.PageInfo<void>(name);
}
