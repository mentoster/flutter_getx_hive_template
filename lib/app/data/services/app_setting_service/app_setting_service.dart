import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_theme.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

class AppSettingService extends GetxService {
  final getBox = GetStorage();
  final log = Logger('AppSettingService');
  Future<AppSettingService> init() async {
    return this;
  }
}
