
import '../../domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({required bool registered}) : super(registered: registered);

  factory LoginResponseModel.fromJSON(Map<String, dynamic> json) => LoginResponseModel(registered: json['registered']);

}