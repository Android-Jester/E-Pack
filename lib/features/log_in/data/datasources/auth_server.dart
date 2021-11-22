import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/log_in/data/models/auth_model.dart';

abstract class AuthServer {
  Future? sendAuthenticationData({
    required String email,
    required String password,
  });
}

class AuthServerImpl implements AuthServer {
  Account account = Account(AppWriteServer.initClient());

  Future<Session> _getResponseFromServer(AuthUserModel model) async {
    Future<Session> result = account.createSession(
      email: model.email,
      password: model.password,
    );
    result.then((value) {
      print(value.clientName);
    });
    return result;
  }

  @override
  Future? sendAuthenticationData(
          {required String email, required String password}) =>
      _getResponseFromServer(AuthUserModel(email: email, password: password));
}
