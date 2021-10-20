import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:logging/logging.dart';

class RootController extends GetxController {
  final log = Logger('RootController');
  var registred = false.obs;
  bool? nullRegistred;
  @override
  void onInit() {
    checkRegistry();
    super.onInit();
  }

  checkRegistry() async {
    var appSettinsBox = await Hive.openBox('appSettingsBox');
    bool? resultLogin = appSettinsBox.get('registred');
    log.info('resultLogin :$resultLogin');
    if (resultLogin == null) {
      registred.value = false;
      nullRegistred = true;
    } else {
      registred.value = resultLogin;
    }

    log.info(registred.value);
  }
}
