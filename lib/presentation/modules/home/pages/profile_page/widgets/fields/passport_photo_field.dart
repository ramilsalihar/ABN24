import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import 'package:project_name/core/extensions/padding_extension.dart';

import '../passport_holder.dart';

class PassportPhotoField extends StatefulWidget {
  const PassportPhotoField({super.key});

  @override
  State<PassportPhotoField> createState() => _PassportPhotoFieldState();
}

class _PassportPhotoFieldState extends State<PassportPhotoField> {
  File? image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() => this.image = imageTemporary);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.i10n.front_side_of_passport,
        ).padding(
          EdgeInsets.all(context.dimens.paddingSmall),
        ),
        const PassportHolder(
          type: 1,
        ),
        Text(
          context.i10n.back_side_of_passport,
        ).padding(
          EdgeInsets.all(context.dimens.paddingSmall),
        ),
        const PassportHolder(
          type: 2,
        ),
      ],
    );
  }
}
