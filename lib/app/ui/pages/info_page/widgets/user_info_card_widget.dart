import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/controllers/info_controller.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';
import 'package:get/get.dart';

class UserInfoCardWidget extends StatelessWidget {
  const UserInfoCardWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InfoController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Obx(() => Text(controller.userModel.value.name,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
              subtitle: Obx(() => Text(controller.userModel.value.maidenName)),
              leading: Icon(
                Icons.account_circle_outlined,
                color: Colors.blue[500],
              ),
            ),
            const Divider(),
            ListTile(
              title: Obx(() => Text(controller.userModel.value.phoneW,
                  style: const TextStyle(fontWeight: FontWeight.w500))),
              leading: Icon(
                Icons.contact_phone,
                color: Colors.blue[500],
              ),
            ),
            ListTile(
              title: Obx(() => Text(controller.userModel.value.emailU)),
              leading: Icon(
                Icons.contact_mail,
                color: Colors.blue[500],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
