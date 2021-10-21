import 'package:flutter_getx_hive_template/app/controllers/root_controller.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

import '../data/models/login_model.dart';

class LoginController extends GetxController {
  final log = Logger('LoginController');
  var loginModel = LoginModel().obs;
  var registred = false.obs;
  late Box<dynamic> loginBox;
  late Box<dynamic> appSettinsBox;
  RootController rootController = Get.find();
  @override
  void onInit() async {
    // init box
    loginBox = await Hive.openBox('loginBox');
    appSettinsBox = await Hive.openBox('appSettingsBox');
    loadLogin();
    super.onInit();
  }

  void saveLogin(String email, String password) async {
    loginModel.value = LoginModel(email: email, password: password);
    loginBox.put("userLogin", loginModel.value);
    if (registred.value == false) {
      registred.value = true;
      rootController.registred.value = true;
    }
  }

  void loadLogin() {
    if (loginBox.get("userLogin") == null) {
      registred.value = false;
    } else {
      loginModel.value = loginBox.get("userLogin");
      registred.value = true;
    }
    appSettinsBox.put("registred", registred.value);
  }
}
