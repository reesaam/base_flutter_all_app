import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/app_extensions/extensions_on_material_widgets/extension_text.dart';
import '../../../data/resources/app_paddings.dart';
import '../../../data/resources/app_theme/app_themes.dart';

class AppDividers {
  static Widget general({Color? color}) => Divider(color: color ?? AppThemes.to.primaryColor);

  static Widget generalWithInlineText({required String text, Color? color}) => Stack(alignment: Alignment.center, children: [
        general(color: color ?? AppThemes.to.primaryColor),
        Container(
          padding: AppPaddings.buttonXLarge,
          color: Get.context?.findAncestorWidgetOfExactType<Container>()?.color ?? Get.context?.findAncestorWidgetOfExactType<Scaffold>()?.backgroundColor ?? AppThemes.to.canvasColor,
          child: Text(text).withColor(color ?? AppThemes.to.primaryColor),
        ),
      ]);

  static Widget get generalWithCanvasColor => general(color: AppThemes.to.canvasColor);

  static Widget get generalWithPrimaryColor => general(color: AppThemes.to.primaryColor);

  static Widget get generalWithDisabledColor => general(color: AppThemes.to.disabledColor);

  static Widget get settings => generalWithDisabledColor;
}
