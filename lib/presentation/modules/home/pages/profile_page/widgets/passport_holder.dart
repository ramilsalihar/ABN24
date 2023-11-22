import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:project_name/core/extensions/i10n_context.dart';
import '../cubit/profile_page_cubit.dart';

class PassportHolder extends StatefulWidget {
  const PassportHolder({super.key, required this.type});

  final int type;

  @override
  State<PassportHolder> createState() => _PassportHolderState();
}

class _PassportHolderState extends State<PassportHolder> {
  bool isUploaded = true;
  XFile? photo;

  @override
  Widget build(BuildContext context) {
    isUploaded = context.read<ProfilePageCubit>().state.data.userData!.file_check == 1;
    return Container(
        width: 350,
        height: 200,
        decoration: BoxDecoration(
          color: isUploaded ? Colors.green : Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            Center(
              child: !isUploaded
                  ? Text(
                context.i10n.no_photo_uploaded,
                style: const TextStyle(color: Colors.white),
              )
                  : const Icon(
                Icons.check_circle,
                color: Colors.white,
                size: 35,
              ),
            ),
            !isUploaded ? Positioned(
              bottom: 10,
              right: 10,
              child: ElevatedButton(
                onPressed: pickImage,
                child: const Icon(Icons.camera_alt),
              ),
            ) : const SizedBox.shrink(),
          ],
        ),
      );
  }

  void pickImage() async {
    final ImagePicker picker = ImagePicker();
    XFile? photo = await picker.pickImage(
      source: ImageSource.camera,
    );

    File image = File(photo!.path);

    BlocProvider.of<ProfilePageCubit>(context).uploadPassport(image, widget.type);

  }
}
