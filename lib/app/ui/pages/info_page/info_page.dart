import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/data/models/user_model.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';
import 'package:get/get.dart';
import 'package:logging/logging.dart';
import '../../../controllers/info_controller.dart';

class InfoPage extends GetView<InfoController> {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Counter page",
              ),
              IconButton(
                  onPressed: controller.toCounter,
                  // onPressed: () => {},
                  icon: const Icon(Icons.plus_one))
            ],
          ),
        ),
        body: SafeArea(
          child: FutureBuilder<UserModel>(
              future: controller.fetchApi(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: CircleAvatar(
                          radius: 30.0,
                          backgroundColor: Colors.transparent,
                          child: ClipOval(
                              child: Image.network(
                                  "https://www.gravatar.com/avatar/00000000000000000000000000000000")),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(defaultPadding),
                        child: Card(
                          child: Column(
                            children: [
                              ListTile(
                                title: Obx(() => Text(
                                    controller.userModel.value.name,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500))),
                                subtitle: Obx(() => Text(
                                    controller.userModel.value.maidenName)),
                                leading: Icon(
                                  Icons.account_circle_outlined,
                                  color: Colors.blue[500],
                                ),
                              ),
                              const Divider(),
                              ListTile(
                                title: Obx(() => Text(
                                    controller.userModel.value.phoneW,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.w500))),
                                leading: Icon(
                                  Icons.contact_phone,
                                  color: Colors.blue[500],
                                ),
                              ),
                              ListTile(
                                title: Obx(() =>
                                    Text(controller.userModel.value.emailU)),
                                leading: Icon(
                                  Icons.contact_mail,
                                  color: Colors.blue[500],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                print("You! pressed on this button!");
                              },
                              child: const Text('Save')),
                          const SizedBox(
                            width: defaultPadding,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                controller.fetchApi();
                              },
                              child: const Text('Get new')),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Column(children: [
                    const Icon(
                      Icons.error_outline,
                      color: Colors.red,
                      size: 60,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: Text('Error: ${snapshot.error}'),
                    )
                  ]);
                } else {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Center(
                          child: SizedBox(
                            child: CircularProgressIndicator(),
                            width: 60,
                            height: 60,
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(top: 16),
                            child: Text('Awaiting result...'),
                          ),
                        )
                      ]);
                }
              }),
        ));
  }
}
