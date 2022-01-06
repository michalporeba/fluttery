library fuxim;

import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({
    Key? key,
    required this.title,
    required this.message,
  }) : super(key: key);

  final String title;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Text(title + ':: ' + message),
        );
  }
}