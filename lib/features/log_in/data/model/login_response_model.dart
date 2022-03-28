import 'package:e_pack/features/log_in/domain/entities/login_response.dart';

class LoginResponseModel extends LoginResponse {
  LoginResponseModel({required bool registrationStatus}) : super(registrationStatus: registrationStatus);

  factory LoginResponseModel.fromJSON(Map<String, dynamic> json) => LoginResponseModel(registrationStatus: json['registrationStatus']);

}