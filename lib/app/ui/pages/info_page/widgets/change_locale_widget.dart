import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/translation/languages_names.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangeLocaleWidget extends StatefulWidget {
  const ChangeLocaleWidget({Key? key}) : super(key: key);

  @override
  State<ChangeLocaleWidget> createState() => _ChangeLocaleWidgetState();
}

class _ChangeLocaleWidgetState extends State<ChangeLocaleWidget> {
  String dropdownValue = 'English';
  @override
  void initState() {
    // String? savedLanguage = GetStorage().read("isDarkTheme");
    dropdownValue =
        LanguagesNames.getCountryNameForCode(Get.deviceLocale!.languageCode);
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
              Get.updateLocale(
                  Locale(LanguagesNames.getCodeForCountryName(newValue)));
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
