import 'package:abn24/presentation/modules/home/bloc/home_cubit.dart';
import 'package:abn24/presentation/modules/login/bloc/login_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import '../modules/login/login_page.dart';
import '../modules/home/home_page.dart';

class Routes {
  static const home = '/home';
  static const login = '/login';

  static final Map<String, WidgetBuilder> routeMap = {
    home: (context) => BlocProvider<HomeCubit>(
          create: (ctx) => GetIt.I<HomeCubit>(),
          child: const HomePage(),
        ),
    login: (context) => BlocProvider(
          create: (ctx) => LoginCubit(),
          child: const LoginPage(),
        )
  };
}
