import 'package:flutter/material.dart';

extension ToEdgeInsets on double {
  EdgeInsets get all => EdgeInsets.all(this);

  EdgeInsets get top => EdgeInsets.only(top: this);

  EdgeInsets get right => EdgeInsets.only(right: this);

  EdgeInsets get bottom => EdgeInsets.only(bottom: this);

  EdgeInsets get left => EdgeInsets.only(left: this);

  EdgeInsets get vertical => EdgeInsets.symmetric(vertical: this);

  EdgeInsets get horizontal => EdgeInsets.symmetric(horizontal: this);

  EdgeInsets asEdgeInsetsWith({
    double? top,
    double? right,
    double? bottom,
    double? left,
  }) =>
      EdgeInsets.only(
        top: top ?? this,
        right: right ?? this,
        bottom: bottom ?? this,
        left: left ?? this,
      );
}

extension ToSizedBox on double {
  /// @return [SizedBox] with [height] equal to [this]
  SizedBox get verticalBox => SizedBox(height: this);

  /// @return [SizedBox] with [width] equal to [this]
  SizedBox get horizontalBox => SizedBox(width: this);

  /// @return [SizedBox] with [width] and [height] equal to [this]
  SizedBox get squareBox => SizedBox(width: this, height: this);
}