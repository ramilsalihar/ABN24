import 'package:flutter/material.dart';
import 'package:project_name/core/extensions/padding_extension.dart';
import 'package:project_name/presentation/modules/home/widgets/app_avatar.dart';

import '../../../../../../domain/models/user.dart';

class UserInfo extends StatefulWidget {
  const UserInfo({super.key, required this.user});

  final UserData user;

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2 * context.dimens.paddingSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppAvatar(isEdit: false),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(
                top: context.dimens.paddingMedium,
                left: context.dimens.paddingSmall,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${widget.user.last_name} ${widget.user.first_name}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.user.phone,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.user.email,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
          //TODO: add edit button
          // const SizedBox(width: 16),
          // IconButton(
          //   icon: const Icon(Icons.edit),
          //   onPressed: () {
          //     // Action to perform when the edit button is pressed
          //   },
          // ),
        ],
      ),
    );
  }
}
