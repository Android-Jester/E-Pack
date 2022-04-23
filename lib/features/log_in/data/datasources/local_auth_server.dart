import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalLoginServer {
  Future<void> cacheLoginInfo({required String username});
}

class LocalLoginServerImpl extends LocalLoginServer {
  final SharedPreferences sharedPreferences;
  LocalLoginServerImpl({required this.sharedPreferences});

  @override
  Future<void> cacheLoginInfo({required String username}) async {
    await sharedPreferences.setString("local_user", username);
  }

}