import 'package:flutter/material.dart';

import 'delivery_option/components/body.dart';

class DeliveryOption extends StatelessWidget {
  static String id = "Page1";

  const DeliveryOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
