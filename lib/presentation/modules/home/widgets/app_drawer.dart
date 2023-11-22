import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/buttons/logout_button.dart';
import 'package:project_name/presentation/modules/auth/auth_cubit/auth_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/cubit/profile_page_cubit.dart';
import '../../../routes/app_router.gr.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: Svg('assets/background/about_app.svg'),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.grey,
                backgroundImage: AssetImage(
                  'assets/icons/avatar.jpg',
                )),
            _drawerHeader(
              context,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            profileButton(context),
            const Spacer(),
            BlocListener<AuthCubit, AuthData>(
              listener: _logoutListener,
              child: LogoutButton(
                onPressed: () {
                  context.read<AuthCubit>().logout();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget profileButton(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(const ProfileRoute());
        Navigator.pop(context);
      },
      child: Row(
        children: [
          const Icon(Icons.perm_identity),
          const SizedBox(width: 16),
          Text(context.i10n.my_profile),
        ],
      ),
    ).padding(
      EdgeInsets.all(2 * context.dimens.paddingSmall),
    );
  }

  void _logoutListener(BuildContext context, AuthData state) {
    if (state.authState is LoginLoadingState) {
      EasyLoading.show(status: context.i10n.loading);
    } else {
      EasyLoading.dismiss();
    }

    if (state.authState is LogoutSuccessState) {
      context.router.replace(const LoginRoute());
    }
  }
}

Widget _drawerHeader(BuildContext context) {
  final user = context.select(
    (ProfilePageCubit cubit) => cubit.state.data.userData,
  );

  if (user != null) {
    return Column(
      children: [
        Text(
          '${user.first_name} ${user.last_name}',
          overflow: TextOverflow.fade,
        ).padding(
          EdgeInsets.fromLTRB(
            context.dimens.paddingLarge,
            context.dimens.paddingMedium,
            context.dimens.paddingLarge,
            context.dimens.paddingTiny,
          ),
        ),
        Text(
          user.email,
          overflow: TextOverflow.fade,
        ).padding(
          EdgeInsets.fromLTRB(
            context.dimens.paddingLarge,
            context.dimens.paddingMedium,
            context.dimens.paddingLarge,
            context.dimens.paddingTiny,
          ),
        ),
      ],
    );
  } else {
    return Center(
      child: Text(context.i10n.loading),
    );
  }
}
