import 'package:flutter/material.dart';

import '../../../app/components/buttons/app_general_button.dart';
import '../../../app/components/buttons/app_icon_button.dart';
import '../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../../app/components/dialogs/app_alert_widget_dialogs.dart';
import '../../../app/components/dialogs/app_bottom_dialogs.dart';
import '../../../app/components/general_widgets/app_check_box.dart';
import '../../../app/components/general_widgets/app_dividers.dart';
import '../../../app/components/general_widgets/app_image.dart';
import '../../../app/components/general_widgets/app_popup_menu.dart';
import '../../../app/components/general_widgets/app_popup_menu_item.dart';
import '../../../app/components/general_widgets/app_progress_indicator.dart';
import '../../../app/components/general_widgets/app_snack_bars.dart';
import '../../../app/components/general_widgets/app_switch.dart';
import '../../../app/components/general_widgets/app_text_field.dart';
import '../../../app/components/main_components/app_bottom_navigation_bar.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_icon.dart';
import '../../../core/app_extensions/extensions_on_material_widgets/extension_on_text.dart';
import '../../../core/core_functions.dart';
import '../../../core/elements/core_view.dart';
import '../../../app/components/main_components/app_bar.dart';
import '../../../data/resources/app_logos.dart';
import '../../../data/shared_models/core_models/app_page_detail/app_page_detail.dart';
import '../../../data/resources/app_enums.dart';
import '../../../data/resources/app_icons.dart';
import '../../../data/resources/app_paddings.dart';
import '../../admin_general_functions.dart';
import '../controller/admin_widget_check_controller.dart';

class AdminWidgetCheckPage extends CoreView<AdminWidgetCheckController> {
  const AdminWidgetCheckPage({super.key});

  @override
  PreferredSizeWidget? get appBar => AppAppBar(pageDetail: controller.pageDetail);

  @override
  EdgeInsets? get pagePadding => AppPaddings.zero;

  @override
  Widget get body => Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
        AppDividers.general(),
        _dividers(),
        _iconButtons(),
        _popUpMenu(),
        _textFields(),
        _generalButtons(),
        _checkBoxes(),
        _switches(),
        _images(),
        _progressIndicators(),
        _alertDialogs(),
        _bottomSheetDialog(),
        _snackBars(),
        _appBar(),
        _bottomNavigationBar(),
        _icons(),
      ]);

  _dividers() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppDividers General', widget: AppDividers.general()),
        AdminFunctions.item(primary: true, title: 'AppDividers General PrimaryColor', widget: AppDividers.generalWithPrimaryColor),
        AdminFunctions.item(title: 'AppDividers GeneralText', widget: AppDividers.generalWithInlineText(text: 'Some Text')),
        AdminFunctions.item(
            primary: true, title: 'AppDividers GeneralText PrimaryColor', widget: AppDividers.generalWithInlineText(text: 'Some Text')),
        AdminFunctions.item(title: 'AppDividers Settings', widget: AppDividers.settings),
      ], title: 'Dividers');

  _iconButtons() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'IconButton\nDefaultColor',
            widget: AppIconButton(
              icon: AppIcons.home,
              text: 'IconButton',
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'IconButton\nPrimaryColor',
            widget: AppIconButton(
              icon: AppIcons.home,
              text: 'IconButton',
              primaryColor: true,
              onTap: controller.functionCalledDialog,
            )),
      ], isRow: true, title: 'Icon Buttons');

  _popUpMenu() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'Popup Menu\nDefaultColor',
            widget: AppPopupMenu(
                listItems: List<AppPopupMenuItem>.generate(
                    5,
                    (index) => AppPopupMenuItem(
                          text: 'Popup Menu Item',
                          onTapFunction: controller.functionCalledDialog,
                        )))),
        AdminFunctions.item(
            title: 'Popup Menu\nPrimaryColor',
            primary: true,
            widget: AppPopupMenu(
                primaryColorIcon: true,
                listItems: List<AppPopupMenuItem>.generate(
                    5,
                    (index) => AppPopupMenuItem(
                          text: 'Popup Menu Item',
                          onTapFunction: controller.functionCalledDialog,
                        ))))
      ], isRow: true, title: 'Popup Menu');

  _textFields() {
    var textFieldHint = 'Text Field Hint';
    var textFieldLabel = 'Text Field Label';
    var textFieldData = 'Text Field Data';
    TextEditingController ctrl = TextEditingController();
    TextEditingController ctrlWithData = TextEditingController();
    TextEditingController ctrlWithMultipleLinesData = TextEditingController();
    ctrlWithData.text = textFieldData;
    ctrlWithMultipleLinesData.text = '$textFieldData\n$textFieldData\n$textFieldData\n$textFieldData';

    return AdminFunctions.section([
      AdminFunctions.item(
          title: 'TextField Editable with Leading Icon', widget: AppTextField(controller: ctrl, hint: textFieldHint, leadingIcon: AppIcons.info)),
      AdminFunctions.item(
          title: 'TextField Editable with Prefix and Suffix',
          widget: AppTextField(
              controller: ctrl,
              hint: textFieldHint,
              prefixIcon: AppIcons.add,
              prefixAction: controller.functionCalledDialog,
              suffixIcon: AppIcons.settings,
              suffixAction: controller.functionCalledDialog)),
      AdminFunctions.item(
          title: 'TextField Not Editable',
          widget: AppTextField(
            editable: false,
            controller: ctrl,
            hasCounter: true,
            label: textFieldLabel,
            hint: textFieldHint,
            suffixIcon: AppIcons.settings,
            suffixAction: controller.functionCalledDialog,
          )),
      AdminFunctions.item(
        title: 'TextField with Data',
        widget: AppTextField(
          controller: ctrlWithData,
          hasCounter: true,
          hint: textFieldHint,
          suffixIcon: AppIcons.settings,
          suffixAction: controller.functionCalledDialog,
        ),
      ),
      AdminFunctions.item(
          title: 'TextField Expandable',
          widget: AppTextField(
            controller: ctrlWithMultipleLinesData,
            hasCounter: true,
            maxLength: 100,
            showMaxLength: true,
            label: textFieldLabel,
            hint: textFieldHint,
            suffixIcon: AppIcons.settings,
            suffixAction: controller.functionCalledDialog,
          )),
      AdminFunctions.item(
          title: 'TextField Whole Widget Function',
          widget: AppTextField(
            controller: ctrl,
            label: textFieldLabel,
            hint: textFieldHint,
            wholeWidgetAction: controller.functionCalledDialog,
          )),
      AdminFunctions.item(
          title: 'TextField with Error',
          widget: AppTextField(
            controller: ctrlWithData,
            label: textFieldLabel,
            hint: textFieldHint,
            errorText: 'Error',
          )),
    ], title: 'TextFields');
  }

  _generalButtons() => AdminFunctions.section([
        AdminFunctions.item(
            title: 'AppGeneralButton',
            widget: AppGeneralButton(
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'AppGeneralButton PrimaryColor',
            widget: AppGeneralButton(
              primaryColor: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            title: 'AppGeneralButton Loading',
            widget: AppGeneralButton(
              loading: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            primary: true,
            title: 'AppGeneralButton Primary Loading',
            widget: AppGeneralButton(
              loading: true,
              primaryColor: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
        AdminFunctions.item(
            title: 'AppGeneralButton Disabled',
            widget: AppGeneralButton(
              disabled: true,
              text: 'AppGeneralButton',
              icon: AppIcons.adminPanelIcon.icon!,
              leading: AppIcons.version.icon,
              onTap: controller.functionCalledDialog,
            )),
      ], title: 'General Buttons');

  _checkBoxes() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppCheckBox\nChecked', widget: AppCheckBox(value: true, onChanged: (value) => null)),
        AdminFunctions.item(title: 'AppCheckBox\nNot Checked', widget: AppCheckBox(value: false, onChanged: (value) => null)),
      ], isRow: true, title: 'CheckBoxes');

  _switches() => AdminFunctions.section([
        AdminFunctions.item(title: 'Switch Off', widget: AppSwitch(value: false, onChanged: (value) => null)),
        AdminFunctions.item(title: 'Switch ON', widget: AppSwitch(value: true, onChanged: (value) => null)),
      ], isRow: true, title: 'Switches');

  _images() => AdminFunctions.section([
        AdminFunctions.item(title: 'Image Asset Height Restricted', multipleItems: [
          const AppImage(image: AppLogos.appLogo, size: Size.fromHeight(80)),
          const AppImage(image: AppLogos.developerLogo, size: Size.fromHeight(80)),
        ]),
        AdminFunctions.item(title: 'Image Asset Width Restricted', multipleItems: [
          const AppImage(image: AppLogos.appLogo, size: Size.fromWidth(50)),
          const AppImage(image: AppLogos.developerLogo, size: Size.fromWidth(50)),
        ]),
        AdminFunctions.item(title: 'Image Asset Rounded', multipleItems: [
          const AppImage(image: AppLogos.appLogo, size: Size.fromWidth(50), roundness: 20),
          const AppImage(image: AppLogos.developerLogo, size: Size.fromWidth(50), roundness: 20),
        ]),
      ], title: 'Images');

  _progressIndicators() => AdminFunctions.section([
        AdminFunctions.item(title: 'AppProgressIndicator Circular', widget: AppProgressIndicator.circular()),
        AdminFunctions.item(title: 'AppProgressIndicator Linear', widget: AppProgressIndicator.linear()),
      ], title: 'Progress Indicators');

  _alertDialogs() => AdminFunctions.section([
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog with OK',
          onTap: () => AppAlertDialogs().withOk(title: 'Alert Dialog Title', text: 'App Alert Dialog with Yes/No', onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog with Ok/Cancel',
          onTap: () => AppAlertDialogs().withOkCancel(title: 'Alert Dialog Title', text: 'App Alert Dialog with Ok/Cancel', onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog by Widget with OK',
          onTap: () => AppAlertWidgetDialogs().withOk(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
        AdminFunctions.item(
            widget: AppGeneralButton(
          text: 'Alert Dialog by Widget with Ok/Cancel',
          onTap: () => AppAlertWidgetDialogs().withOkCancel(title: 'Alert Dialog Title', widget: _alertDialogWidget(), onTapOk: popPage),
        )),
      ], title: 'Alert Dialogs');

  _alertDialogWidget() =>
      Column(mainAxisSize: MainAxisSize.min, children: List<Widget>.generate(5, (index) => const Text('Some Widget').withTertiaryColor));

  _bottomSheetDialog() {
    Widget form = Column(
        children: List<Widget>.generate(
            5,
            (index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: const Text('App BottomSheet Dialog without Button').withTertiaryColor,
                )));

    return AdminFunctions.section([
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog without Button',
        onTap: () => AppBottomDialogs().withoutButton(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with OK',
        onTap: () => AppBottomDialogs().withOk(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with Cancel',
        onTap: () => AppBottomDialogs().withCancel(title: 'BottomSheet Dialog', form: form, dismissible: true),
      )),
      AdminFunctions.item(
          widget: AppGeneralButton(
        text: 'BottomSheet Dialog with OK/Cancel',
        onTap: () => AppBottomDialogs().withOkCancel(title: 'BottomSheet Dialog', form: form, onTapOk: popPage, dismissible: true),
      )),
    ], title: 'BottomSheet Dialogs');
  }

  _snackBars() => AdminFunctions.section([
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with LeadingText',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with LeadingText',
                      title: 'AppSnackBar Title',
                      leadingText: 'Leading Text',
                      leadingAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with LeadingIcon',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with LeadingIcon',
                      title: 'AppSnackBar Title',
                      leadingIcon: AppIcons.info,
                      leadingAction: controller.functionCalledDialog,
                    ))),
        AdminFunctions.item(
            widget: AppGeneralButton(
                text: 'Snackbar with Button',
                onTap: () => AppSnackBar().showSnackBar(
                      message: 'App SnackBar with Button',
                      title: 'AppSnackBar Title',
                      buttonText: 'Button',
                      buttonAction: controller.functionCalledDialog,
                    ))),
      ], title: 'SnackBars');

  _appBar() => AdminFunctions.section([
        AdminFunctions.item(
            fullWidth: true,
            widget: AppAppBar(
              pageDetail: const AppPageDetail(pageRoute: AppRoutes.adminWidgetCheckPage, pageName: 'Page Name'),
              barLeading: AppIconButton(icon: AppIcons.list, onTap: nullFunction),
              barAction: AppIconButton(icon: AppIcons.add, onTap: nullFunction),
            )),
      ], title: 'AppBar');

  _bottomNavigationBar() => AdminFunctions.section([
        AdminFunctions.item(
          fullWidth: true,
          widget: const AppBottomNavigationBar(selectedIndex: 0),
        )
      ], title: 'Bottom Navigation Bar');

  _icons() => AdminFunctions.section([
        AdminFunctions.item(
            widget: Scrollbar(
              trackVisibility: true,
              child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                      children: List<Widget>.generate(
                          AppIcons.iconsList.length,
                          (index) => Padding(
                                padding: AppPaddings.pages,
                                child: AppIcons.iconsList[index].withSecondaryColor,
                              )))),
            ),
            fullWidth: true)
      ], title: 'Icons');
}
