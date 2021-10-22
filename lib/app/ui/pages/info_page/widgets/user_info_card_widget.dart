import 'package:flutter/cupertino.dart';
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
      child: Column(
        children: [
          cupertinoListTile(
            title: Obx(() => Text(controller.userModel.value.name,
                style: const TextStyle(fontWeight: FontWeight.w500))),
            subtitle: Obx(() => Text(controller.userModel.value.maidenName)),
            leading: const Icon(
              CupertinoIcons.profile_circled,
            ),
          ),
          const Divider(),
          cupertinoListTile(
            title: Obx(() => Text(controller.userModel.value.phoneW,
                style: const TextStyle(fontWeight: FontWeight.w500))),
            leading: const Icon(
              CupertinoIcons.phone,
            ),
          ),
          cupertinoListTile(
            title: Obx(() => Text(controller.userModel.value.emailU)),
            leading: const Icon(
              CupertinoIcons.mail,
            ),
          ),
        ],
      ),
    );
  }

  Widget cupertinoListTile(
      {Widget title = const SizedBox(),
      Widget subtitle = const SizedBox(),
      Widget leading = const SizedBox()}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: Row(
        children: [
          SizedBox(height: 40, child: FittedBox(child: leading)),
          const SizedBox(width: defaultPadding),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [title, subtitle],
          )
        ],
      ),
    );
  }
}
