import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/storage_option/data/models/storage_request_model.dart';

abstract class StorageDataReceiver {
  Future? sendStorageRequest({
    required String timeCollect,
    required String semesterPeriod,
    required String collectRoomType,
    int largeBoxSizeCount = 0,
    int mediumBoxSizeCount = 0,
    int smallBoxSizeCount = 0,
    required int storageWeeks,
    required String residenceName,
    required String roomNumber,
    required String phoneNumber,
    required String addressType,
    required String accessNote,
    required String locationName,
    required String localPhoneNum,
    required String whatsPhoneNum,
    required String contactTimes,
    required String momoFullName,
    required String momoPhoneNum,
    required double cost,
  });
}

class StorageDataReceiverImpl implements StorageDataReceiver {
  Database database = Database(AppWriteServer.initClient());

  Future<Document>? _getResponseFromServer(StorageRequestModel model) async {
    Future<Document> result = database.createDocument(
      collectionId: '6185f59c8c38e',
      data: model.toJson(),
    );

    return result;
  }

  @override
  Future? sendStorageRequest({
    required String timeCollect,
    required String semesterPeriod,
    required String collectRoomType,
    int largeBoxSizeCount = 0,
    int mediumBoxSizeCount = 0,
    int smallBoxSizeCount = 0,
    required int storageWeeks,
    required String residenceName,
    required String roomNumber,
    required String phoneNumber,
    required String addressType,
    required String accessNote,
    required String locationName,
    required String localPhoneNum,
    required String whatsPhoneNum,
    required String contactTimes,
    required String momoFullName,
    required String momoPhoneNum,
    required double cost,
  }) {
    var model = StorageRequestModel(
        largeBoxSizeCount: largeBoxSizeCount,
        mediumBoxSizeCount: mediumBoxSizeCount,
        smallBoxSizeCount: smallBoxSizeCount,
        timeCollect: timeCollect,
        semesterPeriod: semesterPeriod,
        collectRoomType: collectRoomType,
        storageWeeks: storageWeeks,
        residenceName: residenceName,
        roomNumber: roomNumber,
        phoneNumber: phoneNumber,
        addressType: addressType,
        accessNote: accessNote,
        locationName: locationName,
        localPhoneNum: localPhoneNum,
        whatsPhoneNum: whatsPhoneNum,
        contactTimes: contactTimes,
        momoFullName: momoFullName,
        momoPhoneNum: momoPhoneNum,
        cost: cost);
    _getResponseFromServer(model);
  }
}
