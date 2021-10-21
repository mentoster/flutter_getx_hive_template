import 'package:flutter_getx_hive_template/app/controllers/root_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

import '../data/models/login_model.dart';

class LoginController extends GetxController {
  final log = Logger('LoginController');
  var loginModel = LoginModel().obs;
  var registered = false.obs;
  late Box<dynamic> loginBox;
  final appSettingsBox = GetStorage();
  RootController rootController = Get.find();
  @override
  void onInit() async {
    // init box
    loginBox = await Hive.openBox('loginBox');
    loadLogin();
    super.onInit();
  }

  void saveLogin(String email, String password) async {
    loginModel.value = LoginModel(email: email, password: password);
    loginBox.put("userLogin", loginModel.value);
    if (registered.value == false) {
      registered.value = true;
      rootController.registred.value = true;
      appSettingsBox.write("registered", registered.value);
    }
  }

  void loadLogin() {
    if (loginBox.get("userLogin") == null) {
      registered.value = false;
    } else {
      loginModel.value = loginBox.get("userLogin");
      registered.value = true;
    }
    appSettingsBox.write("registered", registered.value);
  }
}
