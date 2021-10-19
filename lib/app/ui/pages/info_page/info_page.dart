import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/info_controller.dart';

class InfoPage extends GetView<InfoController> {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfoPage'),
      ),
      body: const SafeArea(
        child: Text('InfoController'),
      ),
    );
  }
}
