import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/storage_option/data/models/user_request_model.dart';
import 'package:e_pack/features/storage_option/domain/entities/storage_request.dart';

abstract class ServerHost {
  Future<StorageRequest?>? sendStorageRequest(
    // Time of Collection
    String? timeCollect,
    String? semesterPeriod,

    // Room Type
    String? collectRoomType,

    // Box Sizes
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,

    //Period of Storage
    int? storageWeeks,

    // Collection Information
    String? residenceName,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,

    // Home Location and Contact Information
    String? locationName,
    String? localPhoneNum,
    String? whatsPhoneNum,
    int? contactTimes,

    // Payment Information
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  );
}

class ServerHostImpl implements ServerHost {
  Database database = Database(AppWriteServer().initClient());
  StorageRequestModel? model;

  ServerHostImpl();

  @override
  Future<StorageRequest>? sendStorageRequest(
    // Time of Collection
    String? timeCollect,
    String? semesterPeriod,

    // Room Type
    String? collectRoomType,

    // Box Sizes
    int? largeBoxSizeCount,
    int? mediumBoxSizeCount,
    int? smallBoxSizeCount,

    //Period of Storage
    int? storageWeeks,

    // Collection Information
    String? residenceName,
    int? roomNumber,
    String? phoneNumber,
    String? addressType,
    String? accessNote,

    // Home Location and Contact Information
    String? locationName,
    String? localPhoneNum,
    String? whatsPhoneNum,
    int? contactTimes,

    // Payment Information
    String? momoFullName,
    String? momoPhoneNum,
    double? cost,
  ) {
    model = StorageRequestModel(
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
    database.createDocument(
        collectionId: '60f4529c27565', data: model!.toJson());
    return null;
  }
}

// String collectionId = '60f4529c27565';
// late Database database;
// final UserRequest? request;
// ServerHost(Client client, {required this.request}) {
//   database = Database(client);
//
//
//   result.then((value) => print(value)).catchError((e) => print(e));
// }
//
// updateDocument(Future result) {
//   database.updateDocument(collectionId: collectionId, documentId: , data: UserRequestRepoImpl(request!).sendUserRequest())
// }
// }
