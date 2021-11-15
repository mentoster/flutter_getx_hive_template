import 'package:flutter_getx_hive_template/app/data/services/fake_api_service/fake_api_mapper.dart';
import 'package:logging/logging.dart';

import '../../models/models_generated/user_generated.dart';
import '../../models/user_model.dart';
import 'fake_api_provider.dart';

class FakeUserRepository {
  final FakeUserProvider api = FakeUserProvider();
  final log = Logger('FakeUser repository');
  Future<UserModel> getUser() async {
    UserGenerated userG = await api.getUser()!;
    return fakeUserMapper(userG);
  }
}
