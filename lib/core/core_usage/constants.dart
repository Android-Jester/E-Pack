import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
late AndroidDeviceInfo androidInfo;
late IosDeviceInfo iosInfo;

void initialize() async {
  androidInfo = await deviceInfo.androidInfo;
  iosInfo = await deviceInfo.iosInfo;
  print("RUNNING ON: ${androidInfo.androidId}");
  print("RUNNING ON: ${iosInfo.identifierForVendor}");
}

///Server Routes and Base URL
const String api = "https://epack-api.herokuapp.com/";
const String delivery = "api/client/delivery";
const String storage = "api/client/storage";
const String login = "api/client/login";
const String signup = "api/client/register";

/// Mobile Money Constants
const String baseUrl = '/';
const String apiUser = 'apiuser';
String key = '';
String apiUserx = 'apiuser/${(Platform.isAndroid) ? androidInfo.androidId : iosInfo.identifierForVendor}';
String apiKey = "/apikey";
