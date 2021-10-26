import 'package:appwrite/appwrite.dart';
import 'package:e_pack/features/SignUp/domain/entities/account_create_entities.dart';

class SignUpModel {
  late Account account;
  final Client? client;
  final UserAccount loginInfo;

  SignUpModel({required this.client, required this.loginInfo}) {
    account = Account(client!);
  }

  Future signUp() async {
    var result = await account.create(
        email: loginInfo.email,
        password: loginInfo.password,
        name: "${loginInfo.firstName} ${loginInfo.lastName}");
  }
}
