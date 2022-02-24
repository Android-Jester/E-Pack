import 'package:shared_preferences/shared_preferences.dart';
abstract class LocalLoginData {
  Future<void> cacheUser({required String username});
  Future<String> getUserName();
}

class LocalLoginDataImpl implements LocalLoginData {
  final SharedPreferences shared;
  LocalLoginDataImpl({
    required this.shared,
});

  @override
  Future<void> cacheUser({required String username}) => shared.setString("user", username);


  @override
  Future<String> getUserName() async {
    return shared.getStringList("user")!.first;
  }



}