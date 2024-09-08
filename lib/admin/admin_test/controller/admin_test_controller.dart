import 'package:get/get.dart';

import '../../../app/components/dialogs/app_alert_dialogs.dart';
import '../../../app/functional_components/connectivity/app_connectivity.dart';
import '../../../app/functional_components/file_functions/app_file_functions.dart';
import '../../../app/functional_components/notifications/local_notifications/app_local_notifications.dart';
import '../../../app/functional_components/permissions/app_permissions.dart';
import '../../../core/app_extensions/extensions_on_data_models/extension_permission.dart';
import '../../../core/app_extensions/extensions_on_data_models/extension_settings.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_date_time.dart';
import '../../../core/app_extensions/extensions_on_data_types/extension_duration.dart';
import '../../../core/app_localization_texts.dart';
import '../../../core/core_functions.dart';
import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/resources/app_logos.dart';
import '../../../data/resources/app_theme/app_themes.dart';
import '../../../data/shared_models/core_models/app_data/app_data.dart';
import '../../../data/storage/app_local_storage.dart';
import '../../../features/settings/models/app_settings_data/app_setting_data.dart';

class AdminTestController extends CoreController {

  Rx<bool> darkMode = false.obs;

  @override
  void dataInit() {
    // clearAppData();
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminTestPage;
  }

  ///Internal
  _dialog(String text) async => await AppAlertDialogs().withOk(text: text, onTapOk: popPage);
  String unknownStatus = 'Unknown';

  ///Connections
  changeDarkMode() async {
    darkMode.value = !darkMode.value;
    var settings = const AppSettingData().loadFromStorage();
    settings.copyWith(darkMode: darkMode.value);
    settings.saveOnStorage();
    Get.changeTheme(darkMode.value ? AppThemes.darkTheme : AppThemes.lightTheme);
  }

  ///Connections
  internetConnection() async {
    var result = await AppConnectionChecker().checkInternet();
    await _dialog(result.toString());
  }

  internetStatus() async {
    var result = await AppConnectionChecker().checkInternetStatus();
    await _dialog(result.name.capitalizeFirst ?? unknownStatus);
  }

  checkConnection() async {
    var result = await AppConnectionChecker().checkConnection();
    await _dialog(result.name);
  }

  ///Files
  pickFile() async {
    String message = 'File not Imported';
    var result = await AppFileFunctions().pickFile();
    if (result != null) {
      message = 'Picked FileName:\n${result.path.split('/').last}';
    }
    await _dialog(message);
  }

  saveFile() async {
    String message = 'File nor Saved';
    var resultPick = await AppFileFunctions().pickFile();
    if (resultPick != null) {
      var result = await AppFileFunctions().saveFile(fileName: resultPick.path, data: resultPick.readAsBytesSync());
      message = 'Saved FileName:\n${result?.split('/').last ?? unknownStatus}';
    }
    await _dialog(message);
  }

  ///Permissions
  checkAllPermissions() async {
    var result = await AppPermissions.to.checkAllPermissions();
    String response = Texts.to.empty;
    for (var r in result) {
      response = '$response\n${r.permission}: ${r.status?.getName}';
    }
    await _dialog(response);
  }

  askAllPermissions() async {
    var result = await AppPermissions.to.askAllPermissions();
    String response = Texts.to.empty;
    for (var r in result) {
      var newResponse = '${r.permission}: ${r.status?.getName}';
      response = '$response\n$newResponse';
    }
    await _dialog(response);
  }

  showLocalNotification() async {
    await AppLocalNotifications().simple(
      title: 'Test Notification Title',
      body: 'Test Notification Body',
    );
  }

  showPushNotification() {}

  ///AppData
  saveAppDataTest() async {
    saveAppData();
  }

  loadAppDataTest() async {
    AppData? appData = await loadAppData();
    String response = '';
    response += 'Version: ${appData?.appVersions?.versionsList.isEmpty ?? true ? 'Empty' : appData?.appVersions?.versionsList.last.version}\n';
    response += 'Versions Count: ${appData?.appVersions?.versionsList.length ?? 0}\n';
    response += 'Data Version: ${appData?.dataVersion?.number.toString()}\n';
    response += 'Install DateTime: \n${appData?.statisticsData?.installDateTime.toDateTimeFormat()}\n';
    response += 'Install Duration: \n${appData?.statisticsData?.installDuration.toConditionalFormat()}\n';
    response += 'Launches: ${appData?.statisticsData?.launches.toString()}\n';
    response += 'Page Opens: ${appData?.statisticsData?.pageOpens.toString()}\n';
    response += 'Api Calls: ${appData?.statisticsData?.apiCalls.toString()}\n';
    response += 'Logins: ${appData?.statisticsData?.logins.toString()}\n';
    response += 'Crashes: ${appData?.statisticsData?.crashes.toString()}\n';
    response += 'Language: ${appData?.settings?.language.languageName}\n';
    response += 'Country: ${appData?.settings?.country.countryName}\n';
    response += 'DarkMode: ${appData?.settings?.darkMode}\n';
    _dialog(response);
  }

  importAppDataTest() async => await AppLocalStorage.to.importData();

  exportAppDataTest() async => await AppLocalStorage().exportData();
}
