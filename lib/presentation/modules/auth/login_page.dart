import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/core/widgets/login_footer.dart';

import './widgets/login_form.dart';
import './widgets/signup_form.dart';
import '../../core/widgets/buttons/info_buttons.dart';
import 'auth_cubit/auth_cubit.dart';

const logoAsset = 'assets/logo/logo_title.png';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showInfo = true;

  void updateShowInfo(AuthData state) {
    if (state.authState is ConfirmSmsState ||
        state.authState is SignUpLoadingState ||
        state.authState is UpdatePasswordState) {
      showInfo = false;
    } else {
      showInfo = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: BlocBuilder<AuthCubit, AuthData>(
            builder: (context, state) {
              updateShowInfo(state);
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildLogo(logoAsset),
                  Center(
                    child: state.authMode == AuthMode.login
                        ? const LoginForm()
                        : const SignupForm(),
                  ),
                  showInfo
                      ? const Flexible(
                          flex: 4,
                          fit: FlexFit.loose,
                          child: InfoButtons(),
                        )
                      : const SizedBox(),
                  const Flexible(
                    flex: 0,
                    fit: FlexFit.tight,
                    child: LoginFooter(),
                  ),
                ],
              );
            },
          ),
        ).padding(
          EdgeInsets.all(
            context.dimens.paddingMedium,
          ),
        ),
      ),
    );
  }

  Widget buildLogo(String logoAsset) {
    return Flexible(
        flex: 3,
        child: Image.asset(logoAsset, fit: BoxFit.fitWidth).padding(
          EdgeInsets.only(
            top: context.dimens.paddingLarge,
            bottom: context.dimens.paddingLarge,
            left: context.dimens.paddingMedium,
            right: context.dimens.paddingMedium,
          ),
        ));
  }
}
