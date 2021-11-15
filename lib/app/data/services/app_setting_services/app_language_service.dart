import 'package:flutter_getx_hive_template/app/translation/languages_names.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';
import 'package:flutter/material.dart';

const saveLanguageCode = "Language";

class AppLanguageService extends GetxService {
  final getBox = GetStorage();
  final log = Logger('AppSettingService');

  Future<AppLanguageService> init() async {
    setLanguage(getLocaleNow());
    return this;
  }

  void setLanguage(String? language) {
    if (language != null) {
      Get.updateLocale(Locale(LanguagesNames.getCodeForCountryName(language)));
      GetStorage().write(saveLanguageCode, language);
    }
  }

  static String? getLocaleNow() {
    return GetStorage().read(saveLanguageCode);
  }
}
