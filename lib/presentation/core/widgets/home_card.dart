import 'package:flutter/cupertino.dart';
import 'package:project_name/presentation/routes/app_router.gr.dart';

class HomeCard {
  String title;
  String iconPath;
  VoidCallback nextPage;

  HomeCard({
    required this.title,
    required this.iconPath,
    required this.nextPage,
  });
}

