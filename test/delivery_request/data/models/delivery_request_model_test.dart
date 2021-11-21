import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const timeCollect = "20th October, 2021, 15:30";
  const semesterPeriod = "First Semester";
  const relocateInfo = 1;
  const residenceName = "Whitpam Hostel";
  const collectRoomType = 1;
  const largeBoxSizeCount = 1;
  const mediumBoxSizeCount = 1;
  const smallBoxSizeCount = 1;
  const roomNumber = 213;
  const phoneNumber = "0241119708";
  const addressType = "Hostel";
  const accessNote = null;
  const destinationAddress = "P.O.Box TL 777";
  const destinationRoomNumber = null;
  const contactName = "Duah Kwadwo Adjei";
  const contactPhoneNum = "0241119708";
  const momoFullName = contactName;
  const momoPhoneNum = contactPhoneNum;
  const cost = 154.00;
  final tDeliveryRequestModel = DeliveryRequestModel(
      smallBoxSizeCount: smallBoxSizeCount,
      mediumBoxSizeCount: mediumBoxSizeCount,
      largeBoxSizeCount: largeBoxSizeCount,
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

  test("should be a subclass of the entity", () async {
    expect(tDeliveryRequestModel, isA<DeliveryRequest>());
  });
}
