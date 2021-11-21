import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';

abstract class DeliveryDataReciever {
  Future? sendDeliveryRequest(
      {required String? timeCollect,
      required String? semesterPeriod,
      required int? largeBoxSizeCount,
      required int? mediumBoxSizeCount,
      required int? smallBoxSizeCount,
      required int? relocateInfo,
      required String? residenceName,
      required String? collectRoomType,
      required String? roomNumber,
      required String? phoneNumber,
      required String? addressType,
      String? accessNote,
      String? destinationAddress,
      String? destinationRoomNumber,
      String? contactName,
      String? contactPhoneNum,
      required String? momoFullName,
      required String? momoPhoneNum,
      required double? cost});
}

class DeliveryDataRecieverImpl implements DeliveryDataReciever {
  Database database = Database(AppWriteServer.initClient());

  Future<Document>? _getResponseFromServer(DeliveryRequestModel model) async {
    Future<Document> result = database.createDocument(
      collectionId: '6185f5ac8eb3e',
      data: model.toJson(),
    );
    return result;
  }

  @override
  Future? sendDeliveryRequest(
      {required String? timeCollect,
      required String? semesterPeriod,
      required int? largeBoxSizeCount,
      required int? mediumBoxSizeCount,
      required int? smallBoxSizeCount,
      required int? relocateInfo,
      required String? residenceName,
      required String? collectRoomType,
      required String? roomNumber,
      required String? phoneNumber,
      required String? addressType,
      String? accessNote,
      String? destinationAddress,
      String? destinationRoomNumber,
      String? contactName,
      String? contactPhoneNum,
      required String? momoFullName,
      required String? momoPhoneNum,
      required double? cost}) {
    var model = DeliveryRequestModel(
        largeBoxSizeCount: largeBoxSizeCount,
        smallBoxSizeCount: smallBoxSizeCount,
        mediumBoxSizeCount: mediumBoxSizeCount,
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
    print(model);
    _getResponseFromServer(model);
  }
}
