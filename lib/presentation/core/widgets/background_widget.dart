import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BackgroundWidget extends StatelessWidget {
  final String asset;
  final BoxFit fit;

  const BackgroundWidget({
    super.key,
    this.asset = 'assets/background/background_register.svg',
    this.fit = BoxFit.fill,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      fit: fit,
    );
  }
}
