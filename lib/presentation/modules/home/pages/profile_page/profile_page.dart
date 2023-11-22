import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/core/widgets/layout/app_scaffold.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/cubit/profile_page_cubit.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/widgets/drop_down_user_info.dart';
import 'package:project_name/presentation/modules/home/pages/profile_page/widgets/save_button.dart';

import '../../../../../domain/models/user.dart';
import 'cubit/profile_page_state.dart';
import 'widgets/user_info.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  static const firstBackgroundAsset = 'assets/background/credits_page.svg';

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    return AppScaffold(
        appBar: AppBar(
          title: Text(loc.my_profile),
        ),
        body: const ProfileContent(),
        background: SvgPicture.asset(
          firstBackgroundAsset,
          fit: BoxFit.cover,
        ));
  }
}

class ProfileContent extends StatefulWidget {
  const ProfileContent({super.key});

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await context.read<ProfilePageCubit>().getProfileData();
      await context.read<ProfilePageCubit>().getOblastList();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePageCubit, ProfilePageState>(
      builder: (context, state) {
        if (state.eventState is ProfileDataLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.eventState is ProfileDataLoaded ||
            state.eventState is ProfileListLoaded ||
            state.eventState is UploadPassportPhoto) {
          final UserData user = state.data.userData!;
          return Padding(
            padding: EdgeInsets.all(context.dimens.paddingSmall),
            child: SingleChildScrollView(
              child: Form(
                child: Column(
                  children: [
                    UserInfo(user: user),
                    const DropDownUserInfo(),
                    SaveButton(
                      onPressed: () {
                        BlocProvider.of<ProfilePageCubit>(context)
                            .updateProfile(user);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state.eventState is ProfileDataSaving) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.eventState is ProfileDataError) {
          return const Center(
            child: Text('Error'),
          );
        }
        return const Center(
          child: Text('Unknown state'),
        );
      },
    );
  }
}
