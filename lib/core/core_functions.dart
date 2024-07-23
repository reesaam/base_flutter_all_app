import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app/components/dialogs/app_alert_dialogs.dart';
import '../app/components/dialogs/app_alert_widget_dialogs.dart';
import '../app/components/general_widgets/app_progress_indicator.dart';
import '../app/components/general_widgets/app_snack_bars.dart';
import '../data/info/app_info.dart';
import '../data/models/app_page_detail/app_page_detail.dart';
import '../data/resources/app_colors.dart';
import '../data/storage/app_local_storage.dart';
import '../features/versions/data/versions_local_data_source.dart';
import '../features/versions/data/versions_remote_data_source.dart';
import '../features/versions/models/app_version/app_version.dart';
import 'app_localization.dart';

void appDebugPrint(message) => AppInfo.isRelease ? null : debugPrint('$message');
void appLogPrint(message) => debugPrint('[LOG] ** $message **');

void popPage() {
  Get.back();
}

void saveAppData() => AppLocalStorage.to.saveAllDataToStorage();

void loadAppData() => AppLocalStorage.to.loadAllDataFromStorage();

void clearAppData() => AppLocalStorage.to.clearStorage();

Future<AppVersionsList?> getVersions() async {
  var remoteResponse = await VersionsRemoteDataSource().getVersions();
  var localResponse = await VersionsLocalDataSource().getVersions();
  var response = remoteResponse.isRight() ? remoteResponse : localResponse;
  return response.fold((l) => null, (r) => r);
}

Future<String> checkAvailableVersion() async {
  String version = Texts.to.notAvailable;
  var response = await getVersions();
  if (response != null && response.versionsList.isNotEmpty) {
    version = response.versionsList.last.version;
  }
  return version;
}

Future<AppVersion> getCurrentVersion() async {
  AppVersionsList? versions = await getVersions();
  AppVersion version = versions == null ? AppVersion.createEmpty() : versions.versionsList.last;
  return version;
}

noInternetConnectionSnackBar() => AppSnackBar().showSnackBar(message: Texts.to.connectionInternetNotAvailableText);

showLoadingDialog() => AppAlertWidgetDialogs().withoutButton(widget: AppProgressIndicator.linear(color: AppColors.appDefaultColorSecond));

appExitDialog() => AppAlertDialogs().withOkCancel(title: Texts.to.appExit, text: Texts.to.areYouSure, onTapOk: appExit, dismissible: true);

appRestart({AppPageDetail? bootPage}) async {
  showLoadingDialog();
  appLogPrint('App Reset Triggered');
  AppLocalStorage.to.saveAllDataToStorage();
  appLogPrint('All App Data Saved');
  Get.reloadAll();
}

appReset() {}

appExit() {
  appLogPrint('App Exit Triggered');
  AppLocalStorage.to.saveAllDataToStorage();
  appLogPrint('All App Data Saved');
  exit(0);
}
