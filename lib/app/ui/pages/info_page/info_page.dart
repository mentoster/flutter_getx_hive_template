import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/info_controller.dart';
import '../../../data/models/user_model.dart';
import 'widgets/change_theme_widget.dart';
import 'widgets/error_widget.dart';
import 'widgets/get_new_button_widget.dart';
import 'widgets/loading_widget.dart';
import 'widgets/user_avatar_widget.dart';
import 'widgets/user_info_card_widget.dart';

class InfoPage extends GetView<InfoController> {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Info page",
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              FutureBuilder<UserModel>(
                  future: controller.fetchApi(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const UserAvatarWidget(),
                          UserInfoCardWidget(controller: controller),
                          GetNewButtonWidget(controller: controller),
                        ],
                      );
                    } else if (snapshot.hasError) {
                      return Column(
                        children: [
                          InfoErrorWidget(error: snapshot.error),
                          GetNewButtonWidget(controller: controller),
                        ],
                      );
                    } else {
                      return const LoadingWidget();
                    }
                  }),
              ChangethemeWidget(),
            ],
          ),
        ));
  }
}
