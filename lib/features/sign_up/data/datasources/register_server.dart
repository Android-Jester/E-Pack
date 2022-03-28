import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/sign_up/data/models/register_user_model.dart';
import 'package:http/http.dart' as net;

abstract class RegisterServer {
  Future<void> registerUser({
    required RegisterUserModel model,
  });
}

class RegisterServerImpl implements RegisterServer {

  @override
  Future<void> registerUser({required RegisterUserModel model}) async {
    net.Response response = await net.get(Uri.parse("$api$signup"));
    // return response.body;
    print(response.body);
  }
}
