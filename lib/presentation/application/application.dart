import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:project_name/presentation/modules/auth/auth_cubit/auth_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/credits_history/bloc/credit_history_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/get_credit_page/bloc/credit_page_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/news_and_notifications/cubit/notifications_cubit.dart';
import 'package:project_name/presentation/modules/info/info_cubit/info_cubit.dart';
import 'package:project_name/presentation/routes/app_router.dart';
import '../application/bloc/application_cubit.dart';
import '../core/theme/app_theme.dart';
import '../modules/home/pages/profile_page/cubit/profile_page_cubit.dart';

class ABN24 extends StatelessWidget {
  const ABN24({super.key});

  @override
  Widget build(BuildContext context) {
    AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => ApplicationCubit()),
        BlocProvider(create: (context) => InfoCubit()),
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ProfilePageCubit()),
        BlocProvider(create: (context) => CreditPageCubit()),
        BlocProvider(create: (context) => CreditHistoryCubit()),
        BlocProvider(create: (context) => NotificationsCubit()),
      ],
      child: MaterialApp.router(
        title: 'ABN24',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        routerConfig: appRouter.config(),
        builder: EasyLoading.init(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
