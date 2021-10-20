import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

class HiveDb extends GetxService {
  final log = Logger('HiveDB');
  Future<HiveDb> init() async {
    await Hive.initFlutter();
    return this;
  }
}
