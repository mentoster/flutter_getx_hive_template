import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/home_page/home_page.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/info_page/info_page.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/login_page/login_page.dart';
import 'package:get/get.dart';
import '../../../controllers/bottomnavbar_controller.dart';

class BottomnavbarPage extends StatelessWidget {
  const BottomnavbarPage({Key? key}) : super(key: key);
  final List<Widget> _tabs = const [HomePage(), LoginPage(), InfoPage()];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomnavbarController>(
      builder: (controller) {
        return CupertinoTabScaffold(
            tabBar: CupertinoTabBar(
              backgroundColor: CupertinoTheme.of(context)
                  .barBackgroundColor
                  .withOpacity(1.0),
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.home), label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.settings_solid),
                    label: 'Settings'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled),
                    label: 'Profile')
              ],
            ),
            tabBuilder: (BuildContext context, index) {
              return _tabs[index];
            });
      },
    );
  }
}
