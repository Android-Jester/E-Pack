import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/log_in/data/datasources/local/local_login_data.dart';
import 'package:e_pack/features/log_in/data/datasources/remote/auth_server.dart';
import 'package:e_pack/features/log_in/data/model/login_model.dart';
import 'package:e_pack/features/log_in/domain/entities/authenticating_user.dart';
import 'package:e_pack/features/log_in/domain/repositories/auth_repo.dart';

typedef _GetModelInstance = Future<String> Function();

class AuthRepoImpl implements AuthRepo {
  final AuthServer server;
  final LocalLoginData localData;
  NetworkInfo networkInfo;

  AuthRepoImpl({
    required this.localData,
    required this.server,
    required this.networkInfo,
  });

  Future<Either<Failure, String>> _getResponse(_GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      // try {
      // acquire model from the User
      try {
        final model = await responseModel();
        //sending the model to datasource
        localData.cacheUser(username: model);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try{
        final model = await localData.getUserName();
        return Right(model);
      } on LocalException {
        return Left(LocalFailure());
      }
    }
  }

  @override
  Future<Either<Failure, String>> authenticateUser(String email, String password) async =>
      await _getResponse(() async => server.loginUser(model: LoginModel(email: email, password: password)));
}
