import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/data/services/app_setting_services/app_language_service.dart';
import 'package:flutter_getx_hive_template/app/translation/languages_names.dart';
import 'package:get/get.dart';

class ChangeLocaleWidget extends StatefulWidget {
  ChangeLocaleWidget({Key? key}) : super(key: key);
  final AppLanguageService _appLanguageService = AppLanguageService();

  @override
  State<ChangeLocaleWidget> createState() => _ChangeLocaleWidgetState();
}

class _ChangeLocaleWidgetState extends State<ChangeLocaleWidget> {
  String dropdownValue = 'English';
  @override
  void initState() {
    String? savedLanguage = AppLanguageService.getLocaleNow();
    if (savedLanguage != null) {
      dropdownValue = savedLanguage;
    } else {
      dropdownValue =
          LanguagesNames.getCountryNameForCode(Get.deviceLocale!.languageCode);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Language"),
        DropdownButton<String>(
          value: dropdownValue,
          icon: const Icon(Icons.arrow_downward),
          iconSize: 24,
          elevation: 16,
          underline: Container(
            height: 2,
          ),
          onChanged: (String? newValue) {
            setState(() {
              dropdownValue = newValue!;
              widget._appLanguageService.setLanguage(newValue);
            });
          },
          items: LanguagesNames.countryNames
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }
}
