import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../shared_models/helper_models/duration_custom_model/duration_custom_model.dart';

part 'app_currency_model.freezed.dart';
part 'app_currency_model.g.dart';

@freezed
class AppCurrencyModel with _$AppCurrencyModel {
  const factory AppCurrencyModel({
    final String? name,
    final String? localName,
    final String? abbreviation,
    final String? localAbbreviation,
    final String? sign,
    final String? localSign,
  }) = _AppCurrencyModel;

  factory AppCurrencyModel.fromJson(Map<String, dynamic> json) => _$AppCurrencyModelFromJson(json);
}

@unfreezed
class AppCurrencyModelsList with _$AppCurrencyModelsList {
  factory AppCurrencyModelsList({@Default(<AppCurrencyModel>[]) List<AppCurrencyModel> countriesList}) = _AppCurrencyModelsList;

  factory AppCurrencyModelsList.fromJson(Map<String, dynamic> json) => _$AppCurrencyModelsListFromJson(json);
}