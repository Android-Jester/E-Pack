import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/server/appwrite_server.dart';

abstract class RegisterServer {
  Future<User> registerUser({
    required String email,
    required String password,
    required String name,
  });
}

class RegisterServerImpl implements RegisterServer {
  Account account = Account(AppWriteServer.initClient());

  @override
  Future<User> registerUser({required String email, required String password, required String name}) async =>
      account.create(name: name, email: email, password: password);
}
