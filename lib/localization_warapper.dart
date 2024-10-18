import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:vinca/app_assets/lists/localization_list.dart';

// ToDo: Add the supported locales
EasyLocalization localizationWrapper({
  required Widget child,
}) {
  return EasyLocalization(
    supportedLocales: localeList,
    path: 'assets/languages',
    fallbackLocale: const Locale('en', 'US'),
    child: child,
  );
}
