import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/log_in/data/model/login_model.dart';
import 'package:http/http.dart' as net;

abstract class AuthServer {
  Future<void> loginUser({
    required LoginModel model,
  });
}

class AuthServerImpl implements AuthServer {
  // Initializing the account for client

  // Logs in user
  @override
  Future<void> loginUser({
    required LoginModel model,
  }) async {
    /// Sends the data of the login model to the server
    net.Response response = await net.post(Uri.parse("$api"));
    if(response.statusCode == 200){}
  }
}
