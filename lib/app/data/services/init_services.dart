import 'package:get/get.dart';
import 'package:logging/logging.dart';

import '../../../hive_helper/register_adapters.dart';
import 'app_setting_service/app_setting_service.dart';
import 'getx_storage_service/gerx_storage_service.dart';
import 'hive_service/hive_service.dart';
import 'logging_service/log_setup.dart';

Future<void> initServices() async {
  setupLogging();

  final log = Logger('initServices');
  log.info('Starting services ...');
  // init hive
  await Get.putAsync(() => HiveService().init());
  await Get.putAsync(() => GetxStorageService().init());
  await Get.putAsync(() => AppSettingService().init());
  // init hive classes
  registerAdapters();

  log.info('All services started...');
}
