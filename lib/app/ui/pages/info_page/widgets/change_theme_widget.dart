import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/data/services/app_setting_service/app_setting_service.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangethemeWidget extends StatefulWidget {
  ChangethemeWidget({Key? key}) : super(key: key);
  final AppSettingService _appSettingService = Get.find();
  @override
  State<ChangethemeWidget> createState() => _ChangethemeWidgetState();
}

class _ChangethemeWidgetState extends State<ChangethemeWidget> {
  final _isDarkTheme = GetStorage().read("isDarkTheme");
  Map<bool?, List<bool>> isSelectedMap = {
    null: <bool>[true, false, false],
    true: <bool>[false, true, false],
    false: <bool>[false, false, true],
  };
  @override
  Widget build(BuildContext context) {
    var isSelected = isSelectedMap[_isDarkTheme];
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Theme"),
          ToggleButtons(
            borderRadius:
                const BorderRadius.all(Radius.circular(defaultPadding)),
            children: const <Widget>[
              Icon(Icons.phone_android), //system
              Icon(Icons.dark_mode), //dark
              Icon(Icons.light_mode), //light
            ],
            onPressed: (int index) {
              setState(() {
                // chage buttons visually
                for (int buttonIndex = 0;
                    buttonIndex < isSelected!.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
                // change theme
                if (index == 0) {
                  widget._appSettingService.setStartTheme(null);
                } else if (index == 1) {
                  widget._appSettingService.setStartTheme(true);
                } else if (index == 2) {
                  widget._appSettingService.setStartTheme(false);
                }
              });
            },
            isSelected: isSelected!,
          ),
        ],
      ),
    );
  }
}
