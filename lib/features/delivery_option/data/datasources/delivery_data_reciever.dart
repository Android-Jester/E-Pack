import 'dart:convert';

import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_response_model.dart';
import 'package:e_pack/features/delivery_option/domain/entities/response.dart';
import "package:http/http.dart" as net;
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
