import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool canBack;
  const MyAppBar({
    Key? key,
    required this.title,
    this.canBack = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
      title,
    ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
