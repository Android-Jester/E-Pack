import 'package:appwrite/appwrite.dart' show Account, Client;
import 'package:appwrite/models.dart';
import 'package:e_pack/features/login/data/models/login_info.dart';

class AppwriteLogin {
  late Account account;
  final Client? client;
  final LoginInfo loginInfo;
  AppwriteLogin({required this.client, required this.loginInfo}) {
    account = Account(client!);
  }

  Future loggingIn() async {
    Session result = await account.createSession(
        email: loginInfo.email, password: loginInfo.password);
  }
}
