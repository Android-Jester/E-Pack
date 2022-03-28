import 'dart:convert';

import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_model.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_response.dart';
import 'package:http/http.dart' as net;

import '../../domain/entities/storage_response_request.dart';

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
    net.Response response = await net.post(Uri.parse("$api/storage?username=$username"),
    body: model.toJson(),
    );
    if(response.statusCode == 200) {
     return StorageRequestResponseModel.fromJSON(json.decode(response.body));
    } else {
      throw ServerException("data didn't send");
    }
  }
}
