import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/delivery_option/data/models/user_request_model.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';

abstract class ServerHost {
  Future<DeliveryRequest?>? sendDeliveryRequest(
    String? timeCollect,
    String? semesterPeriod,
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,
    int? relocateInfo,
    String? residenceName,
    String? collectRoomType,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,
    String? destinationAddress,
    int? destinationRoomNumber,
    String? contactName,
    String? contactPhoneNum,
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  );
}

class ServerHostImpl implements ServerHost {
  Database database = Database(AppWriteServer().initClient());
  DeliveryRequestModel? model;

  ServerHostImpl();

  @override
  Future<DeliveryRequest>? sendDeliveryRequest(
    String? timeCollect,
    String? semesterPeriod,
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,
    int? relocateInfo,
    String? residenceName,
    String? collectRoomType,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,
    String? destinationAddress,
    int? destinationRoomNumber,
    String? contactName,
    String? contactPhoneNum,
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  ) {
    model = DeliveryRequestModel(
        timeCollect: timeCollect,
        semesterPeriod: semesterPeriod,
        relocateInfo: relocateInfo,
        residenceName: residenceName,
        collectRoomType: collectRoomType,
        roomNumber: roomNumber,
        phoneNumber: phoneNumber,
        addressType: addressType,
        accessNote: accessNote,
        destinationAddress: destinationAddress,
        destinationRoomNumber: destinationRoomNumber,
        contactName: contactName,
        contactPhoneNum: contactPhoneNum,
        momoFullName: momoFullName,
        momoPhoneNum: momoPhoneNum,
        cost: cost);
    database.createDocument(
        collectionId: '60f4529c27565', data: model!.toJson());
    return null;
  }
}
