import 'package:flutter/material.dart';
import 'package:project_name/presentation/core/theme/dimens/dimens.dart';

extension DimensExtensions on BuildContext {
  Dimens get dimens => Dimens();
}

extension WidgetExtension on Widget {
  Widget padding(EdgeInsetsGeometry edge) => Padding(
    padding: edge,
    child: this,
  );
}