import 'package:flutter/material.dart';
import 'package:zwmb/data/models/langauge_model.dart';

class AppConstants {
  //app data
  static const String appName = 'Glopey';
  static const String appVersion = '1.0';

  // Shared Key
  static const String theme = 'theme';

  //colors
  static const Color mainColor = Color(0xFF01b258);
  static const Color secondaryColor = Color(0xFFE0B974);
  static const Color white = Color(0xFFFFFFFF);
  static const Color grey = Color(0xFFefeff4);
  static const Color black = Color(0xff333333);

  static List<LanguageModel> languages = [
    LanguageModel(
        languageName: 'English', countryCode: 'US', languageCode: 'en'),
    LanguageModel(
        languageName: 'Arabic', countryCode: 'SA', languageCode: 'ar'),
  ];
}
