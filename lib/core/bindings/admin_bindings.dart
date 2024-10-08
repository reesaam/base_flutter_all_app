import 'package:get/get.dart';

import '../../admin/admin_app_countries/controller/admin_app_countries_controller.dart';
import '../../admin/admin_app_info/controller/admin_app_info_controller.dart';
import '../../admin/admin_app_resources/controller/admin_app_resources_controller.dart';
import '../../admin/admin_data_format_check/controller/admin_data_format_check_controller.dart';
import '../../admin/admin_start/controller/admin_start_controller.dart';
import '../../admin/admin_test/controller/admin_test_controller.dart';
import '../../admin/admin_verifiers/controller/admin_verifiers_controller.dart';
import '../../admin/admin_widget_check/controller/admin_widget_check_controller.dart';
import '../../admin/app_docs/controller/app_docs_controller.dart';

class AdminBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminStartController>(() => AdminStartController(), fenix: true);
    Get.lazyPut<AdminTestController>(() => AdminTestController(), fenix: true);
    Get.lazyPut<AdminAppInfoController>(() => AdminAppInfoController(), fenix: true);
    Get.lazyPut<AdminAppResourcesController>(() => AdminAppResourcesController(), fenix: true);
    Get.lazyPut<AdminWidgetCheckController>(() => AdminWidgetCheckController(), fenix: true);
    Get.lazyPut<AdminDataFormatCheckController>(() => AdminDataFormatCheckController(), fenix: true);
    Get.lazyPut<AdminVerifiersController>(() => AdminVerifiersController(), fenix: true);
    Get.lazyPut<AdminAppCountriesController>(() => AdminAppCountriesController(), fenix: true);
    Get.lazyPut<AppDocsController>(() => AppDocsController(), fenix: true);
  }
}
