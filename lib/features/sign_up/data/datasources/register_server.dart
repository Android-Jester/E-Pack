import 'package:appwrite/appwrite.dart';
import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/sign_up/data/models/register_user_model.dart';
import 'package:e_pack/features/sign_up/domain/entities/registering_user.dart';

abstract class RegisterServer {
  Future<Either<Failure, RegisterUser>> registerUser({
    required String email,
    required String password,
    required String name,
  });
}

class RegisterServerImpl implements RegisterServer {
  Account account = Account(AppWriteServer().initClient());
  Future<Either<Failure, RegisterUser>> _getResponseFromServer(
      RegisterUserModel model) async {
    var response;
    Future result = account.create(
        name: model.name, email: model.email, password: model.password);
    result
        .then((value) => response)
        .catchError((_) => ServerException("data cannot be sent"));
    return response;
  }

  @override
  Future<Either<Failure, RegisterUser>> registerUser(
          {required String email,
          required String password,
          required String name}) =>
      _getResponseFromServer(
          RegisterUserModel(email: email, password: password, name: name));
}
