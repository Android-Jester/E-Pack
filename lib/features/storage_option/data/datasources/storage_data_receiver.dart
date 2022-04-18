import 'dart:convert';
import 'package:http/http.dart' as net;

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
    net.Response response = await net.post(Uri.parse("$api$storage?username=$username"),
    body: model.toJson(),
    );
    if(response.statusCode == 200) {
     return StorageRequestResponseModel.fromJSON(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
