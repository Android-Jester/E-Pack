import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_model.dart';
import 'package:http/http.dart' as net;

abstract class StorageDataReceiver {
  Future<void> sendStorageRequest({
    required StorageRequestModel model,
    required String username,
  });
}

class StorageDataReceiverImpl implements StorageDataReceiver {

  @override
  Future<void> sendStorageRequest({
    required StorageRequestModel model,
    required String username,
  }) async {
    net.Response response = await net.post(Uri.parse("$api/storage?username=$username"),
    body: model.toJson(),
    );
    print(response.body);
  }
}
