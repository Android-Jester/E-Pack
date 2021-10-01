import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:flutter/material.dart';

class Screen2 extends StatefulWidget {
  int selectedRadio = 0;
  final PageController? controller;
  Config config = Config();
  late final int currentPage;

  Screen2({this.controller, required this.currentPage});

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    widget.config.init(context);
    return;
  }
}
