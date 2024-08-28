import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart';

import '../core/app_extensions/extensions_on_data_types/extension_app_languages.dart';
import '../core/app_extensions/extensions_on_data_models/extension_settings.dart';
import '../data/resources/app_countries.dart';
import '../data/resources/app_enums.dart';
import '../features/settings/models/app_settings_data/app_setting_data.dart';
import '../generated/l10n.dart';
import 'app_extensions/extensions_on_data_types/extension_on_list.dart';

class AppLocalization {
  static AppLocalization get to => Get.find();

  get supportedLocales => S.delegate.supportedLocales;

  static List<Locale> get languagesList => [english, deutsch, persian];
  static Locale get english => Locale(AppLanguages.english.locale.languageCode, AppCountry.us.code);
  static Locale get deutsch => Locale(AppLanguages.deutsch.locale.languageCode, AppCountry.germany.code);
  static Locale get persian => Locale(AppLanguages.persian.locale.languageCode, AppCountry.iran.code);

  get localizationDelegates => [_delegate, _material, _widgets, _cupertino];
  AppLocalizationDelegate get _delegate => S.delegate;
  LocalizationsDelegate get _material => GlobalMaterialLocalizations.delegate;
  LocalizationsDelegate get _widgets => GlobalWidgetsLocalizations.delegate;
  LocalizationsDelegate get _cupertino => GlobalCupertinoLocalizations.delegate;

  ///Default Variables
  Locale language = english;
  AppCountry country = AppCountry.us;
  String timeZoneAbbreviation = AppCountry.us.timeZoneAbbreviation?.first ?? '';
  bool isDst = false;
  TextDirection textDirection = TextDirection.ltr;

  Locale getLocale() {
    var appSettings = const AppSettingData().loadFromStorage();
    language = appSettings.language.getLocale();
    return language;
  }

  TextDirection getTextDirection() {
    var appSettings = const AppSettingData().loadFromStorage();
    textDirection = appSettings.language.getLocale() == persian ? TextDirection.rtl : textDirection;
    return textDirection;
  }

  TimeZone getTimeZone() => TimeZone(
        DateTime.now().timeZoneOffset.inMilliseconds,
        abbreviation: _getTimeZoneAbbreviation,
        isDst: _getDST,
      );

  AppCountry getCountry() {
    var appSettings = const AppSettingData().loadFromStorage();
    // country = appSettings.country;
    return country;
  }

  String get _getTimeZoneAbbreviation {
    var tza = getCountry().timeZoneAbbreviation?.getMiddleElement<String>();
    timeZoneAbbreviation = tza ?? timeZoneAbbreviation;
    return timeZoneAbbreviation;
  }

  bool get _getDST {
    isDst = _getTimeZoneAbbreviation.isEmpty ? false : _getTimeZoneAbbreviation.contains('DT');
    return isDst;
  }
}
