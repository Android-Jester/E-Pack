import 'dart:convert';
import "package:http/http.dart" as net;

import '../../../../core/core_usage/constants.dart';
import '../../domain/entities/response.dart';
import '../models/delivery_request_model.dart';
import '../models/delivery_response_model.dart';
abstract class DeliveryDataReciever {
  Future<DeliveryResponse> sendDeliveryRequest({required DeliveryRequestModel model});
}

class DeliveryDataRecieverImpl implements DeliveryDataReciever {
  final String username;

  DeliveryDataRecieverImpl({required this.username});
  @override
  Future<DeliveryResponse> sendDeliveryRequest({required DeliveryRequestModel model}) async {
    net.Response response = await net.post(
      Uri.parse("$api/$delivery?username=$username"),
      body: model.toJson(),
    );

    return DeliveryResponseModel.fromJSON(json.decode(response.body));


  }
}
