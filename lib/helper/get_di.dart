import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zwmb/controller/theme_controller.dart';
import 'package:zwmb/data/models/langauge_model.dart';
import 'package:zwmb/util/app_constants.dart';

Future<Map<String, Map<String, String>>> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  // logic
  Get.lazyPut(() => sharedPreferences);
  // Repository

  // Controller
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  // Get.lazyPut(() => BottomNavController());

  Map<String, Map<String, String>> languages = {};
  for (LanguageModel languageModel in AppConstants.languages) {
    String jsonStringValues = await rootBundle
        .loadString('assets/language/${languageModel.languageCode}.json');
    Map<String, dynamic> mappedJson = jsonDecode(jsonStringValues);
    Map<String, String> json = {};
    mappedJson.forEach((key, value) {
      json[key] = value.toString();
    });
    languages['${languageModel.languageCode}_${languageModel.countryCode}'] =
        json;
  }
  return languages;
}
