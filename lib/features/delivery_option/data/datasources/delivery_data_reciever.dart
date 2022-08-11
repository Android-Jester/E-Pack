import 'dart:convert';

import "package:dio/dio.dart";

import '../../../../core/core_usage/constants.dart';
import '../../../../injector.dart';
import '../../../log_in/data/model/login_model.dart';
import '../../domain/entities/response.dart';
import '../models/delivery_request_model.dart';
import '../models/delivery_response_model.dart';

abstract class DeliveryDataReceiver {
  Future<DeliveryResponse> sendDeliveryRequest({required DeliveryRequestModel model});
}

class DeliveryDataReceiverImpl implements DeliveryDataReceiver {
  DeliveryDataReceiverImpl();
  @override
  Future<DeliveryResponse> sendDeliveryRequest({required DeliveryRequestModel model}) async {
    Response response = await baseLink.post("/$delivery", queryParameters: {"username" : locator.get<LoginModel>()}, data: model.toJson(),);


    return DeliveryResponseModel.fromJSON(json.decode(response.data));
  }
}
