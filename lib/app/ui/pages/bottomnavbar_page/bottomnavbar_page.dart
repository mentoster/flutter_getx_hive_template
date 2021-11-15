import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/home_page/home_page.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/info_page/info_page.dart';
import 'package:flutter_getx_hive_template/app/ui/pages/login_page/login_page.dart';
import 'package:get/get.dart';
import '../../../controllers/bottomnavbar_controller.dart';

class BottomnavbarPage extends StatelessWidget {
  const BottomnavbarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomnavbarController>(
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.tabIndex,
            children: const [
              HomePage(),
              LoginPage(),
              InfoPage(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: Icons.home,
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Icons.login,
                label: 'News',
              ),
              _bottomNavigationBarItem(
                icon: Icons.info,
                label: 'Account',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required IconData icon, required String label}) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }
}
