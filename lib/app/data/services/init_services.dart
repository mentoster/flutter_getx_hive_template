import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../../hive_helper/register_adapters.dart';
import 'hive_dv_service/hive_db.dart';
import 'logging_service/log_setup.dart';

Future<void> initServices() async {
  setupLogging();

  final log = Logger('initServices');
  log.info('Starting services ...');
  // init hive
  await Get.putAsync(() => HiveDb().init());
  // init hive classes
  registerAdapters();

  log.info('All services started...');
}
