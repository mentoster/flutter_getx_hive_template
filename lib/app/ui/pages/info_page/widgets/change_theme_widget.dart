import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/data/services/app_setting_services/app_theme_service.dart';

import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';
import 'package:get/get.dart';

class ChangethemeWidget extends StatefulWidget {
  ChangethemeWidget({Key? key}) : super(key: key);
  final AppThemeService _appThemeService = AppThemeService();
  @override
  State<ChangethemeWidget> createState() => _ChangethemeWidgetState();
}

class _ChangethemeWidgetState extends State<ChangethemeWidget> {
  Map<bool?, List<bool>> isSelectedMap = {
    null: <bool>[true, false, false],
    true: <bool>[false, true, false],
    false: <bool>[false, false, true],
  };
  bool? whatSelected = AppThemeService.getThemeNow();
  @override
  Widget build(BuildContext context) {
    var isSelected = isSelectedMap[whatSelected];
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Theme".tr),
        ToggleButtons(
          borderRadius: const BorderRadius.all(Radius.circular(defaultPadding)),
          children: const <Widget>[
            Icon(Icons.phone_android), //system
            Icon(Icons.dark_mode), //dark
            Icon(Icons.light_mode), //light
          ],
          onPressed: (int index) {
            setState(() {
              // change buttons visually
              for (int buttonIndex = 0;
                  buttonIndex < isSelected!.length;
                  buttonIndex++) {
                if (buttonIndex == index) {
                  isSelected[buttonIndex] = true;
                } else {
                  isSelected[buttonIndex] = false;
                }
              }
            });
            // change theme
            if (index == 0) {
              widget._appThemeService.setTheme(null);
            } else if (index == 1) {
              widget._appThemeService.setTheme(true);
            } else if (index == 2) {
              widget._appThemeService.setTheme(false);
            }
          },
          isSelected: isSelected!,
        ),
      ],
    );
  }
}
