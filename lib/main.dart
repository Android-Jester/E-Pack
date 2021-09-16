import 'dart:io' show Platform;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:system_settings/system_settings.dart';

void main() => runApp(const E_PackServices());

class E_PackServices extends StatelessWidget {
  const E_PackServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (Platform.isAndroid)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(
                child: TextButton(
                    child: const Text("Hello Android"),
                    onPressed: () {
                      // const MethodChannel('system_settings').invokeMethod('app');
                      SystemSettings.app();
                    }),
              ),
            ),
          )
        : const CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              body: Center(child: Text("Hello iOS")),
            ),
          );
  }
}
