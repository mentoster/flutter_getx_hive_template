import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

class RootController extends GetxController {
  var registred = false.obs;
  bool? nullRegistred;
  final appSettingsBox = GetStorage();
  final log = Logger('RootController');
  @override
  void onInit() {
    checkRegistry();
    super.onInit();
  }

  checkRegistry() async {
    bool? resultLogin = appSettingsBox.read("registered");
    if (resultLogin == null) {
      registred.value = false;
      nullRegistred = true;
      log.info('Not registered yet! Go to login page...');
    } else {
      registred.value = resultLogin;
    }
  }
}
