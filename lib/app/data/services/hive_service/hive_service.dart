import 'package:hive_flutter/hive_flutter.dart';
import 'package:logging/logging.dart';

class HiveService {
  final log = Logger('HiveDB');
  Future<HiveService> init() async {
    await Hive.initFlutter();
    return this;
  }
}
