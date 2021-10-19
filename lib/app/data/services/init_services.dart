import 'package:get_storage/get_storage.dart';
import 'package:logging/logging.dart';

import 'logging_service/log_setup.dart';

Future<void> initServices() async {
  setupLogging();
  final log = Logger('initServices');

  log.info('Starting services ...');

  /// Here is where you put get_storage, hive, shared_pref initialization.
  /// or moor connection, or whatever that's async.
  // await Get.putAsync(() => DbService().init());
  // await Get.putAsync(SettingsService()).init();
  await GetStorage.init();

  log.info('All services started...');
}
