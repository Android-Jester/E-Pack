import 'package:dartz/dartz.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/features/log_in/data/model/login_model.dart';

import '../../../../../core/Failure/failures.dart';

abstract class AuthServer {
  Future<String> loginUser({
    required LoginModel model,
  });
}

class AuthServerImpl implements AuthServer {
  // Initializing the account for client

  // Logs in user
  @override
  Future<String> loginUser({
    required LoginModel model,
  }) async {

  }}
