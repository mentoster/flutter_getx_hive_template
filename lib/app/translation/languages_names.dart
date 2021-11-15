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
}
