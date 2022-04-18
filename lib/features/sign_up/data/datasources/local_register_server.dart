import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalRegisterServer {
  Future<void> cacheLoginInfo({required String username});
}

class LocalRegisterServerImpl extends LocalRegisterServer {
  final SharedPreferences sharedPreferences;
  LocalRegisterServerImpl({required this.sharedPreferences});

  @override
  Future<void> cacheLoginInfo({required String username}) async {
    await sharedPreferences.setString("local_user", username);
  }

}