import 'package:e_pack_final/features/log_in/data/model/login_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalLoginServer {
  Future<void> cacheLoginInfo({required String username});
  Future<LoginResponseModel> getUsername();
}

class LocalLoginServerImpl extends LocalLoginServer {
  final SharedPreferences sharedPreferences;
  LocalLoginServerImpl({required this.sharedPreferences});

  @override
  Future<void> cacheLoginInfo({required String username}) async {
    await sharedPreferences.setString("local_user", username);
  }

  @override
  Future<LoginResponseModel> getUsername() async {
    try {
      LoginResponseModel(registered: true);
      return (sharedPreferences.getString("local_user") != null) ? LoginResponseModel(registered: true) : LoginResponseModel(registered: false);
    } catch (e) {
      return LoginResponseModel(registered: false);
    }
  }
}
