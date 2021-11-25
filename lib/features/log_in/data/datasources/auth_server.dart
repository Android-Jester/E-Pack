import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/server/appwrite_server.dart';

abstract class AuthServer {
  Future<Session?> loginUser({
    required String email,
    required String password,
  });
}

class AuthServerImpl implements AuthServer {
  // Initializing the account for client
  Account account = Account(AppWriteServer.initClient());

  // Logs in user
  @override
  Future<Session> loginUser({
    required String email,
    required String password,
  }) async =>
      account.createSession(email: email, password: password);
}
