import 'package:get/get.dart';

import '../../../core/app_extensions/extensions_on_enums/extension_on_countries.dart';
import '../../../core/core_functions.dart';
import '../../../core/elements/core_controller.dart';
import '../../../data/info/app_page_details.dart';
import '../../../data/parsers/app_countries/app_countries.dart';
import '../../../data/parsers/app_countries/app_country_model/app_country_model.dart';
import '../../../data/resources/app_countries.dart';

class AdminAppCountriesController extends CoreController {
  // List<AppCountry> countries = AppCountry.values.getSortedCountriesList;
  Rx<AppCountryModelsList> countries = AppCountryModelsList().obs;

  @override
  void dataInit() async {
    // clearAppData();
    countries.value.countriesList = await AppCountries().getCountriesList();
    appDebugPrint('DEBUG');
  }

  @override
  void pageInit() {
    pageDetail = AppPageDetails().adminAppCountriesPage;
  }
}
