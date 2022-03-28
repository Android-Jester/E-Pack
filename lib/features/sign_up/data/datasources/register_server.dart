import 'dart:convert';

import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/sign_up/data/models/register_response_model.dart';
import 'package:e_pack/features/sign_up/data/models/register_user_model.dart';
import 'package:e_pack/features/sign_up/domain/entities/register_response.dart';
import 'package:http/http.dart' as net;

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
      throw ServerException("No SignUp Server");
    }
    print(response.body);
  }
}
