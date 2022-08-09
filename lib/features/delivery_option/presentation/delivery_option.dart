import 'package:flutter/material.dart';

import 'components/body.dart';

class DeliveryOption extends StatelessWidget {
  static String id = "Delivery Option";

  const DeliveryOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Body(),
      );
  }
}
