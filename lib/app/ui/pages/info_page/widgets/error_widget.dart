import 'package:flutter/material.dart';

class InfoErrorWidget extends StatelessWidget {
  final Object? error;
  const InfoErrorWidget({
    Key? key,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Icon(
        Icons.error_outline,
        color: Colors.red,
        size: 60,
      ),
      Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Text('Error: ${error}'),
      )
    ]);
  }
}
