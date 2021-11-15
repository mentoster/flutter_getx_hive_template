import 'dart:convert';

import 'package:flutter_getx_hive_template/app/data/models/user_model.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../models/models_generated/user_generated.dart';


class FakeApiMapper {
  static UserModel fromApi(UserGenerated userGenerated) {
    UserModel userModel = UserModel(
        userGenerated.name!,
        userGenerated.maidenName!,
        userGenerated.phoneW!,
        userGenerated.emailU!);
    return userModel;
  }
}
