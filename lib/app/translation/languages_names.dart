import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguagesNames {
  static List<String> countryNames = [
    'English',
    'French',
    'Spanish',
    'German',
    'Hindi',
    'Portuguese',
    'Chinese',
    'Japanese',
    'Russian'
  ];
  static List<String> countryCodes = [
    'en',
    'fr',
    'es',
    'de',
    'hi',
    'pt',
    'zh',
    'ja',
    'ru',
  ];
  static String getCountryNameForCode(String countryCode) {
    int index = countryCodes.indexOf(countryCode);
    if (index != -1) {
      return countryNames[index];
    } else {
      return countryNames[0];
    }
  }

  static String getCodeForCountryName(String countryName) {
    int index = countryNames.indexOf(countryName);
    if (index != -1) {
      return countryCodes[index];
    } else {
      return countryCodes[0];
    }
  }

  static void updateLocalCode(String? countryCode) {
    if (countryCode != null) {
      int index = countryCodes.indexOf(countryCode);
      if (index != -1) {
        Get.updateLocale(Locale(countryCode));
      } else {
        Get.updateLocale(Locale(countryCodes[0]));
      }
    } else {
      Get.updateLocale(Locale(countryCodes[0]));
    }
  }
}
