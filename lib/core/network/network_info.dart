import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:system_settings/system_settings.dart';

class NetworkInfo {
  late Widget accessed;
  NetworkInfo({required this.accessed});

  void connectionInfo(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text(
                    "You are currently connected to mobile network, please switch to Wifi to proceed"),
                actions: [
                  TextButton(
                    onPressed: () {
                      SystemSettings.wifi();
                    },
                    child: const Text("ok"),
                  ),
                  TextButton(
                    onPressed: () {
                      SystemNavigator.pop(animated: true);
                      // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                    },
                    child: const Text("Close"),
                  ),
                ],
              ));
    } else if (connectivityResult == ConnectivityResult.wifi) {
    } else if (connectivityResult == ConnectivityResult.none) {}
  }
}
