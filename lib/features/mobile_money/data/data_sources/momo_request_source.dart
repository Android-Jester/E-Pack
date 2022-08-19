import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:e_pack_final/core/core_errors/exceptions.dart';
import 'package:e_pack_final/features/mobile_money/data/models/initalize_request_model.dart';
import 'package:e_pack_final/features/mobile_money/data/models/initialize_response_model.dart';
import 'package:e_pack_final/features/mobile_money/data/models/momo_response_model.dart';
import 'package:e_pack_final/features/mobile_money/domain/entities/momo_request.dart';
import 'package:http/http.dart' as net;
import '../../../../core/core_usage/constants.dart';
import '../models/momo_request_model.dart';

abstract class PaymentForm {
  Future<InitializeResponseModel> initialize({required InitializeRequestModel model});
  Future<VerifyPaymentResponseModel> verifyTransaction(VerifyPaymentRequestModel model);
  // Future<PaymentResponseModel> confirmPayment({required String email, required double amount});
}

class Payment implements PaymentForm {


  @override
  Future<InitializeResponseModel> initialize({required InitializeRequestModel model}) async {


    Response response = await requestForm.post(
        "/initialize",
        data: model.toJson(),
    );
    // print("STATUSCODE: ${response.statusCode}");
    if(response.statusCode == 200) {
      return InitializeResponseModel.fromJSON(response.data);
    } else {
      throw ServerException();
    }
  }
  @override
  Future<VerifyPaymentResponseModel> verifyTransaction(VerifyPaymentRequestModel model) async {
    Response response = await requestForm.post(
        "verify/${model.reference}",
        // queryParameters: {
        //   "reference" : model.reference,
        // }
    );
    print("Status Code(Verify): ${response.statusCode}");
    if(response.statusCode == 200) {
      print(response.data);
      return VerifyPaymentResponseModel.fromJSON(json.decode(response.data));

    } else {
      throw ServerException();
    }
  }


  // @override
  // Future<PaymentResponseModel> confirmPayment({required String email, required double amount}) async {
  //   String reference = await initialize(email: email, amount: amount);
  //   return verifyTransaction(reference);
  //
  // }
}