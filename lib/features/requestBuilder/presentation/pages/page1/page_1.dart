import 'package:flutter/material.dart';

import 'components/body.dart';

class Page1 extends StatelessWidget {
  static String id = "Page1";

  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}
