import 'package:dartz/dartz.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/delivery_option/data/datasources/delivery_data_reciever.dart';
import 'package:e_pack/features/delivery_option/data/models/delivery_request_model.dart';
import 'package:e_pack/features/delivery_option/data/repositories/delivery_request_repo_impl.dart';
import 'package:e_pack/features/delivery_option/domain/entities/delivery_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../domain/use_cases/send_delivery_request_test.mocks.dart';
import 'delivery_request_repo_impl_test.mocks.dart';

@GenerateMocks([DeliveryDataReciever, NetworkInfo])
void main() {
  DeliveryRequestRepositoryImpl repoImpl;
  MockDeliveryDataReciever mockServerRequest;
  MockNetworkInfo mockNetworkInfo;
  MockDeliveryRequestRepository mockRepo;

  mockServerRequest = MockDeliveryDataReciever();
  mockNetworkInfo = MockNetworkInfo();
  repoImpl = DeliveryRequestRepositoryImpl(
    serverHost: mockServerRequest,
  );
  mockRepo = MockDeliveryRequestRepository();
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
  const destinationRoomNumber = "213";
  const contactName = "Duah Kwadwo Adjei";
  const contactPhoneNum = "0241119708";
  const momoFullName = contactName;
  const momoPhoneNum = contactPhoneNum;
  const cost = 154.00;
  final tDeliveryRequest = DeliveryRequest(
      mediumBoxSizeCount: mediumBoxSizeCount,
      smallBoxSizeCount: smallBoxSizeCount,
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

  group('sending delivery request to server', () {
    test('should check if device is online', () async {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      //act
      var result = await repoImpl.sendDeliveryRequest(
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
          largeBoxSizeCount: largeBoxSizeCount,
          mediumBoxSizeCount: mediumBoxSizeCount,
          smallBoxSizeCount: smallBoxSizeCount,
          cost: cost);
      //assert
      expect(result, equals(Right(tDeliveryRequest)));
      verify(mockNetworkInfo.isConnected);
      verifyNoMoreInteractions(mockNetworkInfo);
    });
  });
  group('device is online', () {
    // This setUp applies only to the 'device is online' group
    // when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

    test("should return server response", () async {
      //arrange
      when(mockServerRequest.sendDeliveryRequest(
              timeCollect: timeCollect,
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
              cost: cost))
          .thenAnswer((_) async => Right(tDeliveryRequest));
      //act
      final result = await mockRepo.sendDeliveryRequest(
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
        destinationRoomNumber: destinationRoomNumber,
        contactPhoneNum: contactPhoneNum,
        contactName: contactName,
        accessNote: accessNote,
        destinationAddress: destinationAddress,
        addressType: addressType,
        momoFullName: momoFullName,
        momoPhoneNum: momoPhoneNum,
        cost: cost,
      );
      print(result);
      print(await mockRepo.sendDeliveryRequest(
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
      //assert

      expect(result, equals(Right(tDeliveryRequest)));
      verify(mockServerRequest.sendDeliveryRequest(
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
    });
  });
}
