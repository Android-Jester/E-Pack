import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/features/sign_up/data/models/register_user_model.dart';

abstract class RegisterServer {
  Future<String> registerUser({
    required RegisterUserModel model,
  });
}

class RegisterServerImpl implements RegisterServer {
  Account account = Account(AppWriteServer.initClient());

  @override
  Future<User> registerUser({required RegisterUserModel model}) async =>
      account.create(name: model.name, email: model.email, password: model.password).catchError(throw ServerException("Invalid SignUp"));
}
