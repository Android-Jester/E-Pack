import 'dart:convert';

import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/log_in/data/model/login_model.dart';
import 'package:e_pack/features/log_in/data/model/login_response_model.dart';
import 'package:http/http.dart' as net;

import '../../domain/entities/login_response.dart';

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
    if(response.statusCode == 200){
      return LoginResponseModel.fromJSON(json.decode(response.body));
    }
    else {
      throw ServerFailure();
    }
  }
}
