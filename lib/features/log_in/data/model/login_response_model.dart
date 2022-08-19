
import '../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({required bool registered, required String email}) : super(registered: registered, email: email);

  factory LoginResponseModel.fromJSON(Map<dynamic, dynamic> json, String email) {
    return LoginResponseModel(registered: json['registered'], email: email);
  }

}