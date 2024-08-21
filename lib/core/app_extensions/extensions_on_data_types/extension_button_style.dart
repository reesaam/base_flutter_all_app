import 'package:flutter/material.dart';

extension ExtensionButtonCopyWith on ButtonStyle? {
  ButtonStyle? copyWith(
    MaterialStateProperty<Color?>? backgroundColor,
    MaterialStateProperty<BorderSide?>? side,
    AlignmentGeometry? alignment,
    Duration? animationDuration,
    MaterialStateProperty<double?>? elevation,
    bool? enableFeedback,
    MaterialStateProperty<Size?>? fixedSize,
    MaterialStateProperty<Color?>? foregroundColor,
    MaterialStateProperty<Color?>? iconColor,
    MaterialStateProperty<double?>? iconSize,
    MaterialStateProperty<Size?>? maximumSize,
    MaterialStateProperty<Size?>? minimumSize,
    MaterialStateProperty<MouseCursor?>? mouseCursor,
    MaterialStateProperty<Color?>? overlayColor,
    MaterialStateProperty<EdgeInsetsGeometry?>? padding,
    MaterialStateProperty<Color?>? shadowColor,
    MaterialStateProperty<OutlinedBorder?>? shape,
    InteractiveInkFeatureFactory? splashFactory,
    MaterialStateProperty<Color?>? surfaceTintColor,
    MaterialTapTargetSize? tapTargetSize,
    MaterialStateProperty<TextStyle?>? textStyle,
    VisualDensity? visualDensity,
  ) =>
      ButtonStyle(
        backgroundColor: backgroundColor,
        side: side,
        alignment: alignment,
        animationDuration: animationDuration,
        elevation: elevation,
        enableFeedback: enableFeedback,
        fixedSize: fixedSize,
        foregroundColor: foregroundColor,
        iconColor: iconColor,
        iconSize: iconSize,
        maximumSize: maximumSize,
        minimumSize: minimumSize,
        mouseCursor: mouseCursor,
        overlayColor: overlayColor,
        padding: padding,
        shadowColor: shadowColor,
        shape: shape,
        splashFactory: splashFactory,
        surfaceTintColor: surfaceTintColor,
        tapTargetSize: tapTargetSize,
        textStyle: textStyle,
        visualDensity: visualDensity,
      );
}
