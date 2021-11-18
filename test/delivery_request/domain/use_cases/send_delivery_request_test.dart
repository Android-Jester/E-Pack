import 'package:dartz/dartz.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:e_pack/features/delivery_option/domain/repositories/delivery_request_repo.dart';
import 'package:e_pack/features/delivery_option/domain/usecases/send_delivery_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'send_delivery_request_test.mocks.dart';

@GenerateMocks([DeliveryRequestRepository])
void main() {
  SendDeliveryRequest request;
  MockDeliveryRequestRepository mockRepo;

  mockRepo = MockDeliveryRequestRepository();
  request = SendDeliveryRequest(repo: mockRepo);

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

  final DeliveryRequest tdeliveryRequest = DeliveryRequest(
    timeCollect: timeCollect,
    semesterPeriod: semesterPeriod,
    relocateInfo: relocateInfo,
    residenceName: residenceName,
    collectRoomType: collectRoomType,
    largeBoxSizeCount: largeBoxSizeCount,
    mediumBoxSizeCount: largeBoxSizeCount,
    smallBoxSizeCount: largeBoxSizeCount,
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
    cost: cost,
  );

  test("should get data for the server", () async {
    //arrange
    when(mockRepo.sendDeliveryRequest(
      timeCollect: anyNamed("timeCollect"),
      semesterPeriod: anyNamed("semesterPeriod"),
      largeBoxSizeCount: anyNamed("largeBoxSizeCount"),
      mediumBoxSizeCount: anyNamed("mediumBoxSizeCount"),
      smallBoxSizeCount: anyNamed("smallBoxSizeCount"),
      relocateInfo: anyNamed("relocateInfo"),
      residenceName: anyNamed("residenceName"),
      collectRoomType: anyNamed("collectRoomType"),
      roomNumber: anyNamed("roomNumber"),
      phoneNumber: anyNamed("phoneNumber"),
      addressType: anyNamed("addressType"),
      momoFullName: anyNamed("momoFullName"),
      momoPhoneNum: anyNamed("momoPhoneNum"),
      cost: anyNamed("cost"),
      accessNote: anyNamed("accessNote"),
      contactName: anyNamed("contactName"),
      contactPhoneNum: anyNamed("contactPhoneNum"),
      destinationAddress: anyNamed("destinationAddress"),
      destinationRoomNumber: anyNamed("destinationRoomNumber"),
    )).thenAnswer((_) async => Right(tdeliveryRequest));
    //assert
    final result = await request(
        params: Params(
            largeBoxSizeCount: largeBoxSizeCount,
            mediumBoxSizeCount: mediumBoxSizeCount,
            smallBoxSizeCount: smallBoxSizeCount,
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
    expect(result, Right(tdeliveryRequest));

    //verify
    verify(mockRepo.sendDeliveryRequest(
        accessNote: accessNote,
        contactName: contactName,
        destinationAddress: destinationAddress,
        contactPhoneNum: contactPhoneNum,
        destinationRoomNumber: destinationRoomNumber,
        timeCollect: timeCollect,
        semesterPeriod: semesterPeriod,
        largeBoxSizeCount: largeBoxSizeCount,
        mediumBoxSizeCount: mediumBoxSizeCount,
        smallBoxSizeCount: smallBoxSizeCount,
        relocateInfo: relocateInfo,
        residenceName: residenceName,
        collectRoomType: collectRoomType,
        roomNumber: roomNumber,
        phoneNumber: phoneNumber,
        addressType: addressType,
        momoFullName: momoFullName,
        momoPhoneNum: momoPhoneNum,
        cost: cost));
    verifyNoMoreInteractions(mockRepo);
  });
}
