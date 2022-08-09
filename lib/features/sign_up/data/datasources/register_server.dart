import 'dart:convert';


import 'package:dio/dio.dart';

import '../../../../core/core_errors/exceptions.dart';
import '../../../../core/core_usage/constants.dart';
import '../../domain/entities/register_response.dart';
import '../models/register_response_model.dart';
import '../models/register_user_model.dart';

abstract class RegisterServer {
  Future<RegistrationResponse> registerUser({
    required RegisterUserModel model,
  });
}

class RegisterServerImpl implements RegisterServer {
  @override
  Future<RegistrationResponse> registerUser({required RegisterUserModel model}) async {
    Dio dio = Dio(BaseOptions(
      baseUrl: baseurl,
    ));
    Response response = await dio.post(
        signup,
        data: model.toJson(),
    );

    // net.Response response = await net.post(
    //   Uri.parse("$baseurl$signup"),
    //   body: model.toJson(),
    // );
    print("SIGNUP STATUSCODE: ${response.statusCode}");
    if (response.statusCode == 200) {
      print(response.data);
      return RegistrationResponseModel.fromJSON(json.decode(response.data));
    } else {
      throw ServerException();
    }
  }
}
