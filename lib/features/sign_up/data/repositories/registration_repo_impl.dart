import 'package:dartz/dartz.dart';
import 'package:e_pack/core/Failure/failures.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/sign_up/data/datasources/register_server.dart';
import 'package:e_pack/features/sign_up/data/models/register_user_model.dart';
import 'package:e_pack/features/sign_up/domain/entities/registering_user.dart';
import 'package:e_pack/features/sign_up/domain/repositories/registering_user_repo.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

typedef RegisterUserModel _GetModelInstance();

class RegisterRepoImpl implements RegisterRepo {
  final RegisterServer authServer;
  late NetworkInfo networkInfo;

  RegisterRepoImpl({required this.authServer}) {
    networkInfo = NetworkInfoImpl(InternetConnectionChecker());
  }

  Future<Either<Failure, RegisterUser>?> _getResponse(
      _GetModelInstance responseModel) async {
    if (await networkInfo.isConnected) {
      try {
        final model = responseModel();
        authServer.registerUser(
            email: model.email, password: model.password, name: model.name);
        return Right(model);
      } on ServerException {
        return Left(ServerFailure());
      }
    }
  }

  @override
  Future<Either<Failure, RegisterUser>?> registeruser(
          String email, String password, String name) =>
      _getResponse(() =>
          RegisterUserModel(email: email, password: password, name: name));
}
