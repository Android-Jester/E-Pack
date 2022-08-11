import 'package:dio/dio.dart';
import 'package:e_pack_final/core/core_errors/exceptions.dart';

import '../../../../core/core_usage/constants.dart';

abstract class PaymentForm {
  Future confirmPayment({required String email, required String amount});
}

class Payment implements PaymentForm {
  Dio requestForm = Dio(BaseOptions(
      baseUrl: "https://api.paystack.co/transaction",
      headers: {
        "Authorization" : secret_key,
        "Content-Type" : "application/json",
      }
  ));
  Future<String> initialize({required String email, required String amount}) async {

    Response response = await requestForm.post(
        "/initialize",
        data: {
          "email" : email,
          "amount" : amount,
          "currency" : "GHS"
        }
    );
    if(response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException();
    }
  }
  Future<void> verifyTransaction(String reference) async {
    Response response = await requestForm.post(
        "/initialize",
        queryParameters: {
          "reference" : reference,
        }
    );
    print("Status Code(Verify): ${response.statusCode}");
    if(response.statusCode == 200) {
      print("Data(Verify): ${response.data}");
    } else {
      throw ServerException();
    }
  }

  @override
  Future confirmPayment({required String email, required String amount}) async {
    String reference = await initialize(email: email, amount: amount);
    verifyTransaction(reference);
  }
}