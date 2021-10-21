import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/controllers/info_controller.dart';

class GetNewButtonWidget extends StatelessWidget {
  const GetNewButtonWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final InfoController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              controller.fetchApi();
            },
            child: const Text('Get new')),
      ],
    );
  }
}
