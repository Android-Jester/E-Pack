import '../../domain/entities/storage_response_request.dart';

class StorageRequestResponseModel extends StorageRequestResponse {
  StorageRequestResponseModel({required bool successStatus, required String deliveryKey}) : super(successStatus: successStatus, deliveryKey: deliveryKey);

  factory StorageRequestResponseModel.fromJSON(Map<String, dynamic> json) => StorageRequestResponseModel(successStatus: json["success"], deliveryKey: json["deliveryKey"],);

}