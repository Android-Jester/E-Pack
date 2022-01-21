import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/log_in/data/model/login_model.dart';

abstract class AuthServer {
  Future<Session?> loginUser({
    required LoginModel model,
  });
}

class AuthServerImpl implements AuthServer {
  // Initializing the account for client
  Account account = Account(AppWriteServer.initClient());

  // Logs in user
  @override
  Future<Session> loginUser({
    required LoginModel model,
  }) async =>
      account.createSession(email: model.email, password: model.password).catchError(throw ServerException("Invalid or inaccurate login"));
}
