import 'dart:convert';

import 'package:http/http.dart' as net;

import '../../../../core/core_errors/exceptions.dart';
import '../../../../core/core_usage/constants.dart';
import '../../domain/entities/login_response.dart';
import '../model/login_model.dart';
import '../model/login_response_model.dart';

abstract class LoginServer {
  Future<LoginResponse> loginUser({
    required LoginModel model,
  });
}

class LoginServerImpl implements LoginServer {
  // Initializing the account for client

  // Logs in user
  @override
  Future<LoginResponse> loginUser({
    required LoginModel model,
  }) async {
    /// Sends the data of the login model to the server
    net.Response response = await net.post(
      Uri.parse("$api$login"),
      body: model.toJSON(),
    );
    print("RESPONSE: ${response.body}");
    if (response.statusCode == 200) {
      return LoginResponseModel.fromJSON(json.decode(response.body));
    }
    else {
      throw ServerException();
    }
  }
}
