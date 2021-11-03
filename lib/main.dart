import 'package:flutter/material.dart';

import 'features/delivery_option/presentation/delivery_option.dart';

void main() => runApp(
      MyApp(),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DeliveryOption(),
    );
  }
}
