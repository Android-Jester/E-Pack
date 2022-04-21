import 'dart:convert';
import 'package:e_pack_final/features/log_in/data/datasources/auth_server.dart';
import 'package:e_pack_final/features/sign_up/domain/repositories/registering_user_repo.dart';
import "package:http/http.dart" as net;

import '../../../../core/core_usage/constants.dart';
import '../../../../injector.dart';
import '../../../log_in/domain/repositories/auth_repo.dart';
import '../../domain/entities/response.dart';
import '../models/delivery_request_model.dart';
import '../models/delivery_response_model.dart';
abstract class DeliveryDataReciever {
  Future<DeliveryResponse> sendDeliveryRequest({required DeliveryRequestModel model});
}

class DeliveryDataRecieverImpl implements DeliveryDataReciever {
  String username = (locator.get<AuthRepo>().username == '') ? locator.get<RegisterRepo>().username : locator.get<AuthRepo>().username;
  DeliveryDataRecieverImpl();
  @override
  Future<DeliveryResponse> sendDeliveryRequest({required DeliveryRequestModel model}) async {
    net.Response response = await net.post(
      Uri.parse("$api/$delivery?username=$username"),
      body: model.toJson(),
    );

    return DeliveryResponseModel.fromJSON(json.decode(response.body));


  }
}
