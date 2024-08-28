
import 'dart:convert';

import 'package:flutter/services.dart';

import '../../../core/core_functions.dart';
import '../../resources/app_countries.dart';
import '../../resources/app_local_files.dart';
import 'app_country_model/app_country_model.dart';

class AppCountries {
  List<AppCountryModel> countries = List<AppCountryModel>.empty(growable: true);

  Future<List<AppCountryModel>> getCountriesList() async {
    await _loadCountryCodesList();
    return countries;
  }

  _loadCountryCodesList() async {
    String json = await rootBundle.loadString(AppLocalFiles.countriesCodeJsonFile);
    var data = jsonDecode(json);
    List<String> dataList = (data["country-codes"] as List).cast<String>();
    for (var data in dataList) {
      countries.add(AppCountryModel(code: data));
    }
    appDebugPrint('CountryCodes Loaded : ${countries.length}');
  }
}