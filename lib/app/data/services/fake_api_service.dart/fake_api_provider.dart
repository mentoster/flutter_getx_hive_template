import 'dart:convert';

import 'package:flutter_getx_hive_template/app/data/models/models_generated/user_generated.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';

const baseUrl = "https://api.namefake.com/";

class FakeUserApi extends GetConnect {
  final log = Logger('Api');
  getUser() async {
    try {
      Response response = await get(baseUrl);
      if (response.statusCode == 200) {
        var jsonResponse = json.decode(response.body);
        var userG = UserGenerated.fromJson(jsonResponse);
        return userG;
      } else {
        log.printError(info: "Error: ${response.statusCode}");
      }
    } catch (_) {}
  }
}
