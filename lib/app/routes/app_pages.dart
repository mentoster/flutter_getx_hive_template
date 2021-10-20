import 'package:get/get.dart';

import '../bindings/home_binding.dart';
import '../bindings/info_binding.dart';
import '../bindings/login_binding.dart';
import '../ui/pages/home_page/home_page.dart';
import '../ui/pages/info_page/info_page.dart';
import '../ui/pages/login_page/login_page.dart';

part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const HomePage(),
        binding: HomeBinding()),
    GetPage(
        name: Routes.INFO,
        page: () => const InfoPage(),
        binding: InfoBinding()),
    GetPage(
        name: Routes.LOGIN,
        page: () => const LoginPage(),
        binding: LoginBinding()),
  ];
}

abstract class GoToLogin {
  static final page = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const LoginPage(),
        binding: LoginBinding())
  ];
}
