import 'package:flutter/material.dart';

import 'components/body.dart';

class StorageOption extends StatelessWidget {
  static String id = "Page1";

  const StorageOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
