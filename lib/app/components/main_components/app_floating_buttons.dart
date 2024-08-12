import 'package:flutter/material.dart';

import '../../../core/app_extensions/data_types_extensions/extension_icon.dart';

class AppFloatingActionButtons extends FloatingActionButton {
  const AppFloatingActionButtons({super.key, required this.icon, required super.onPressed});

  final Icon icon;

  @override
  Widget? get child => icon.withAppAppBackgroundColor;

  @override
  Widget build(BuildContext context) =>
      FloatingActionButton(mini: true, onPressed: onPressed, child: child);
}
