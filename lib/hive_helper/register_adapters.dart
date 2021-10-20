import 'package:hive/hive.dart';
import 'package:flutter_getx_hive_template/app/data/models/login_model.dart';

void registerAdapters() {
	Hive.registerAdapter(LoginModelAdapter());
}
