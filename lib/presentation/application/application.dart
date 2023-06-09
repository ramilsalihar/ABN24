import 'package:abn24/presentation/application/bloc/application_cubit.dart';
import 'package:abn24/presentation/core/app_theme.dart';
import 'package:abn24/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ABN24 extends StatelessWidget {
  const ABN24({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ApplicationCubit(),
        )
      ],
      child: MaterialApp(
        title: 'ABN24',
        theme: ABNTheme.lightTheme,
        routes: Routes.routeMap,
        initialRoute: Routes.login,
      ),
    );
  }
}
