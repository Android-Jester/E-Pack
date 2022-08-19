import 'dart:convert';

import 'package:dio/dio.dart';
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
    try {
      /// Sends the data of the login model to the server
      Response response = await baseLink.post(
        login,
        data: model.toJSON(),
      );


      if (response.statusCode == 200) {
        return LoginResponseModel.fromJSON(response.data as Map<String, dynamic>, model.email);
      }
      else {
        throw ServerException();
      }
    } catch(e) {
      throw ServerException();
    }
  }
}
