import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';

import '../../features/log_in/data/datasources/local_auth_server.dart';
import '../../injector.dart';

DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
late AndroidDeviceInfo androidInfo;
late IosDeviceInfo iosInfo;
String username = '';

// Dio link
Dio baseLink = Dio(BaseOptions(baseUrl: baseurl));

void initialize() async {
  androidInfo = await deviceInfo.androidInfo;
  username = await locator.get<LocalLoginServer>().getUsername();
  print(username);
  // iosInfo = await deviceInfo.iosInfo;
  print("RUNNING ON: ${androidInfo.androidId}");
  // print("RUNNING ON: ${iosInfo.identifierForVendor}");
}

///Server Routes and Base URL
const String baseurl = "https://epack-api.herokuapp.com/";
const String delivery = "api/client/delivery";
const String storage = "api/client/storage";
const String login = "api/client/login";
const String signup = "api/client/register";

// Payment Options
const String secret_key = "sk_test_5a99341c6df072acc8e182f6343643cbcae7ff08";
