import 'package:logging/logging.dart';

void setupLogging() {
  Logger.root.level = Level.ALL; // defaults to Level.INFO
  Logger.root.onRecord.listen((record) {
    // ignore: avoid_print
    print(
        '${record.level}:${record.time}:${record.loggerName}: ${record.message}');
  });
}
