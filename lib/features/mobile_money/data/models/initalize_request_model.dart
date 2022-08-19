import 'package:e_pack_final/features/mobile_money/domain/entities/intialize_request_entity.dart';

class InitializeRequestModel extends InitializeRequestEntity {
  const InitializeRequestModel({required String email, required double amount, required String callbackUrl}) : super(email: email, amount: amount, callbackUrl: callbackUrl);

  Map<String, dynamic> toJson() => {
    "email": email,
    "amount": amount.toString(),
    "currency" : "GHS",
    "callback_url": callbackUrl
  };
}