
import '../../domain/entities/register_response.dart';

class RegistrationResponseModel extends RegistrationResponse {

  const RegistrationResponseModel({required bool registrationStatus}) : super(registrationStatus: registrationStatus);

  factory RegistrationResponseModel.fromJSON(Map<String, dynamic> json) => RegistrationResponseModel(registrationStatus: json['successfulRegistration']);

}