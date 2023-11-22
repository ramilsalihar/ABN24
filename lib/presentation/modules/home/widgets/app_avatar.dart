import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AppAvatar extends StatefulWidget {
  const AppAvatar({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  @override
  State<AppAvatar> createState() => _AppAvatarState();
}

class _AppAvatarState extends State<AppAvatar> {
  final picker = ImagePicker();
  File? _profilePicFile;


  Future showOptions() async {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => CupertinoActionSheet(
        actions: [
          CupertinoActionSheetAction(
            child: Text('Photo Gallery'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from gallery
              _getImageFromGallery();
            },
          ),
          CupertinoActionSheetAction(
            child: Text('Camera'),
            onPressed: () {
              // close the options modal
              Navigator.of(context).pop();
              // get image from camera
              _getImageFromCamera();
            },
          ),
        ],
      ),
    );
  }

  _getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _profilePicFile = File(pickedFile.path);
      }
    });
  }

  _getImageFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _profilePicFile = File(pickedFile.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CircleAvatar(
          radius: 50,
          child: Image.asset(
            'assets/icons/avatar.jpg',
            fit: BoxFit.cover,
          )
        ),
        // TO be implemented later
        // widget.isEdit
        //     ? IconButton(
        //         onPressed: showOptions,
        //         icon: const Icon(
        //           Icons.edit,
        //           color: Colors.green,
        //           size: 20,
        //         ),
        //         color: Colors.amber,
        //       )
        //     : const SizedBox(),
      ],
    );
  }
}
