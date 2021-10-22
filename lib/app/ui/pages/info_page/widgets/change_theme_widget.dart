import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';
import 'package:get_storage/get_storage.dart';

class ChangethemeWidget extends StatefulWidget {
  const ChangethemeWidget({Key? key}) : super(key: key);
  @override
  State<ChangethemeWidget> createState() => _ChangethemeWidgetState();
}

class _ChangethemeWidgetState extends State<ChangethemeWidget> {
  int segmentedControlGroupValue = 0;
  bool? whatSelected = GetStorage().read("isDarkTheme");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Theme"),
          CupertinoSlidingSegmentedControl(
              children: const {
                0: Text('System'),
                1: Text('Dark'),
                2: Text('Light'),
              },
              groupValue: segmentedControlGroupValue,
              onValueChanged: (newValue) {
                setState(() {
                  segmentedControlGroupValue = int.parse(newValue.toString());
                });
              }),
        ],
      ),
    );
  }
}
