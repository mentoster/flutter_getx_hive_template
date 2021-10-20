import 'package:flutter_getx_hive_template/app/data/models/models_generated/user_generated.dart';
import 'package:flutter_getx_hive_template/app/data/models/user_model.dart';
import 'package:logging/logging.dart';

import 'fake_api_provider.dart';

class FakeUserRepository {
  final FakeUserApi api = FakeUserApi();
  final log = Logger('FakeUser repository');
  Future<UserModel> getUser() async {
    UserGenerated userG = await api.getUser()!;
    return UserModel(
        userG.name!, userG.maidenName!, userG.phoneW!, userG.emailU!);
  }
}
