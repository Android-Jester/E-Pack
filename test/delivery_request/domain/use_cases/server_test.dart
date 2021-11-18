import 'package:appwrite/appwrite.dart';
import 'package:e_pack/core/error/exception.dart';
import 'package:e_pack/core/server/appwrite_server.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
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
  const accessNote = "jj";
  const destinationAddress = "P.O.Box TL 777";
  const destinationRoomNumber = 214;
  const contactName = "Duah Kwadwo Adjei";
  const contactPhoneNum = "0241119708";
  const momoFullName = contactName;
  const momoPhoneNum = contactPhoneNum;
  const cost = 154.00;

  test("connection to server", () {
    _getResponseFromServer(DeliveryRequestModel(
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
        cost: cost));
  });
}
