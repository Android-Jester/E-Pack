import 'dart:convert';

import 'package:dio/dio.dart';

import '../../../../core/core_errors/exceptions.dart';
import '../../../../core/core_usage/constants.dart';
import '../../domain/entities/storage_response_request.dart';
import '../models/storage_request_model.dart';
import '../models/storage_request_response.dart';

abstract class StorageDataReceiver {
  Future<StorageRequestResponse> sendStorageRequest({
    required StorageRequestModel model,
    required String username,
  });
}

class StorageDataReceiverImpl implements StorageDataReceiver {

  @override
  Future<StorageRequestResponse> sendStorageRequest({
    required StorageRequestModel model,
    required String username,
  }) async {
    Response response = await baseLink.post(
        storage,
        data: model.toJson(),
        queryParameters: {
          "username" : username,
    }
    );
    // net.Response response = await net.post(Uri.parse("$baseurl$storage?username=$username"),
    // body: model.toJson(),
    // );
    print("STATUS CODE(Storage): ${response.statusCode}");
    if(response.statusCode == 200) {
      print("Body(Storage): ${response.data}");
     return StorageRequestResponseModel.fromJSON(json.decode(response.data));
    } else {
      throw ServerException();
    }
  }
}
