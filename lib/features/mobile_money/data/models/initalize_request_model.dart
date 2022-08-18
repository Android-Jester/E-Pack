import 'package:e_pack_final/features/mobile_money/domain/entities/intialize_request_entity.dart';

class InitializeRequestModel extends InitializeRequestEntity {
  const InitializeRequestModel({required String email, required double amount}) : super(email: email, amount: amount);

  Map<String, dynamic> toJson() => {
    "email": email,
    "amount": amount,
    "currency" : "GHS",
  };
}