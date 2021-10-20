import 'package:flutter_getx_hive_template/app/data/models/user_model.dart';
import 'package:flutter_getx_hive_template/app/data/services/fake_api_service/fake_api_repository.dart';
import 'package:flutter_getx_hive_template/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

class InfoController extends GetxController {
  final log = Logger('InfoController');
  final FakeUserRepository _fakeUserRepository = FakeUserRepository();

  var userModel = UserModel("", "", "", "").obs;

  @override
  void onInit() {
    fetchApi();
    super.onInit();
  }

  Future<UserModel> fetchApi() async {
    userModel.value = await _fakeUserRepository.getUser();
    return userModel.value;
  }

  getNewUserInfo() => fetchApi();
  toCounter() => Get.toNamed(Routes.INITIAL);
}
