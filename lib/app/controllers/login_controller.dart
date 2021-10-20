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

  @override
  void onInit() async {
    // init box
    loginBox = await Hive.openBox('loginBox');
    appSettinsBox = await Hive.openBox('appSettingsBox');
    loadLogin();
    super.onInit();
  }

  void saveLogin(LoginModel lm) async {
    loginModel.value = lm;
    loginBox.put("userLogin", loginModel.value);
    loginModel.value.save();
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
