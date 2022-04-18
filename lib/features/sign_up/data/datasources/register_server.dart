import 'dart:convert';

import 'package:http/http.dart' as net;

import '../../../../core/core_usage/constants.dart';
import '../../../../core/core_errors/exceptions.dart';
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
    net.Response response = await net.get(Uri.parse("$api$signup"));
    if(response.statusCode == 200) {
      return RegistrationResponseModel.fromJSON(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
