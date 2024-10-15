import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vinca/app_assets/lists/localization_list.dart';

// ToDo: Add the supported locales
EasyLocalization localizationWrapper({
  required Widget child,
  String language = 'en',
  String country = 'US',
}) {
  return EasyLocalization(
    supportedLocales: localeList,
    path: 'assets/languages',
    fallbackLocale: const Locale('en', 'US'),
    startLocale: Locale(language, country),
    child: child,
  );
}
