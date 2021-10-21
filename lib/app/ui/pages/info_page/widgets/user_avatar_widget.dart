import 'package:flutter/material.dart';
import 'package:flutter_getx_hive_template/app/ui/theme/app_constants.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: CircleAvatar(
        radius: 30.0,
        backgroundColor: Colors.transparent,
        child: ClipOval(
            child: Image.network(
                "https://www.gravatar.com/avatar/00000000000000000000000000000000")),
      ),
    );
  }
}
