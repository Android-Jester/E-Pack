import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/log_in/data/models/auth_model.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';

abstract class AuthServer {
  Future<Either<Failure, AuthUser>> sendAuthenticationData({
    required String email,
    required String password,
  });
}

class AuthServerImpl implements AuthServer {
  Account account = Account(AppWriteServer().initClient());
  Future<Either<Failure, AuthUser>> _getResponseFromServer(
      AuthUserModel model) async {
    var response;
    Future result =
        account.createSession(email: model.email, password: model.password);
    result
        .then((value) => response)
        .catchError((_) => ServerException("data cannot be sent"));
    return response;
  }

  @override
  Future<Either<Failure, AuthUser>> sendAuthenticationData(
          {required String email, required String password}) =>
      _getResponseFromServer(AuthUserModel(email: email, password: password));
}
