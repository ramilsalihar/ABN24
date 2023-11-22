import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/presentation/core/widgets/buttons/app_text_button.dart';

import '../../modules/auth/auth_cubit/auth_cubit.dart';
import '../../routes/app_router.gr.dart';

class LoginFooter extends StatefulWidget {
  const LoginFooter({
    super.key,
  });

  @override
  State<LoginFooter> createState() => _LoginFooterState();
}

class _LoginFooterState extends State<LoginFooter> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthData>(
      builder: (context, state) {
        String authTitle = state.authMode.name == 'login'
            ? context.i10n.registration
            : context.i10n.authorization;

        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            AppTextButton(
              onPressed: () =>
                  BlocProvider.of<AuthCubit>(context).switchAuthMode(),
              title: authTitle,
            ),
            AppTextButton(
              onPressed: () => context.pushRoute(
                const AgreementRoute(),
              ),
              title: context.i10n.agreement,
            ),
          ],
        );
      },
    );
  }
}
