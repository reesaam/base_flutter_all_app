import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared_models/helper_models/duration_custom_model/duration_custom_model.dart';
import '../app_currency_model/app_currency_model.dart';

part 'app_country_model.freezed.dart';
part 'app_country_model.g.dart';

@freezed
class AppCountryModel with _$AppCountryModel {
  const factory AppCountryModel({
    final String? code,
    final String? name,
    final List<String>? abbreviations,
    final List<String>? phoneCodes,
    final AppCurrencyModelsList? currencies,
    final List<String>? timeZones,
    final List<DurationCustomModel>? timeZoneOffsets,
    final List<String>? languages,
    final List<String>? languageCodes,
    final String? capital,
    final List<String>? regions,
    final List<String>? majorCities,
  }) = _AppCountryModel;

  factory AppCountryModel.fromJson(Map<String, dynamic> json) => _$AppCountryModelFromJson(json);
}

@unfreezed
class AppCountryModelsList with _$AppCountryModelsList {
  factory AppCountryModelsList({@Default(<AppCountryModel>[]) List<AppCountryModel> countriesList}) = _AppCountryModelsList;

  factory AppCountryModelsList.fromJson(Map<String, dynamic> json) => _$AppCountryModelsListFromJson(json);
}