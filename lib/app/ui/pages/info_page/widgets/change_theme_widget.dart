import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';
import 'package:get/get.dart';

class ChangethemeWidget extends StatefulWidget {
  const ChangethemeWidget({Key? key}) : super(key: key);

  @override
  State<ChangethemeWidget> createState() => _ChangethemeWidgetState();
}

class _ChangethemeWidgetState extends State<ChangethemeWidget> {
  var isSelected = <bool>[true, false, false];
  @override
  Widget build(BuildContext context) {
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
                    buttonIndex < isSelected.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelected[buttonIndex] = true;
                  } else {
                    isSelected[buttonIndex] = false;
                  }
                }
                // change theme
                if (index == 0) {
                  var brightness = MediaQuery.of(context).platformBrightness;
                  bool isDarkMode = brightness == Brightness.dark;
                  isDarkMode
                      ? Get.changeTheme(ThemeData.dark())
                      : Get.changeTheme(ThemeData.light());
                } else if (index == 1) {
                  Get.changeTheme(ThemeData.dark());
                } else if (index == 2) {
                  Get.changeTheme(ThemeData.light());
                }
              });
            },
            isSelected: isSelected,
          ),
        ],
      ),
    );
  }
}
