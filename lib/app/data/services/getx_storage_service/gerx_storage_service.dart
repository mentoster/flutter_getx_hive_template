import 'package:get_storage/get_storage.dart';

class GetxStorageService {
  Future<GetxStorageService> init() async {
    await GetStorage.init();
    return this;
  }
}
