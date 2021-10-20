import 'package:logging/logging.dart';

import '../../models/models_generated/user_generated.dart';
import '../../models/user_model.dart';
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
