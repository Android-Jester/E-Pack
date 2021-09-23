import 'package:dartz/dartz.dart';
import 'package:e_pack/core/network/network_info.dart';
import 'package:e_pack/features/requestBuilder/data/datasources/server_host.dart';
import 'package:e_pack/features/requestBuilder/data/repositories/user_request_repo_impl.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'user_request_repository_impl_test.mocks.dart';

@GenerateMocks([ServerHost, UserRequestRepositoryImpl, NetworkInfo])
void main() {
  UserRequestRepositoryImpl? repository;
  var mockServerHost;
  var mockNetworkInfo;

  const tfirstName = "Kwadwo";
  const tlastName = "Duah";
  const temailAddress = "duah12@outlook.com";
  const tphoneNumber = "0201317498";
  const tlargeBoxSizeCount = 5;
  const tmediumBoxSizeCount = 2;
  const tsmallBoxSizeCount = 1;
  const tlocationName = "Ayduase";
  const tapartmentName = "Whitpam A Hostel";
  const troomNumber = 213;
  const taddress = "Ayduase Gate";
  const tcost = 2550.0;
  final UserRequest? tUserRequest = UserRequest(
      firstName: tfirstName,
      lastName: tlastName,
      emailAddress: temailAddress,
      phoneNumber: tphoneNumber,
      largeBoxSizeCount: tlargeBoxSizeCount,
      mediumBoxSizeCount: tmediumBoxSizeCount,
      smallBoxSizeCount: tsmallBoxSizeCount,
      locationName: tlocationName,
      apartmentName: tapartmentName,
      roomNumber: troomNumber,
      address: taddress,
      cost: tcost);

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockServerHost = MockServerHost();
    repository =
        UserRequestRepositoryImpl(serverHost: mockServerHost, networkInfo: mockNetworkInfo);
  });

  group('request sender', () {
    test('check if device is online', () {
      //arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);

      //act
      repository!.sendUserRequest(
          tfirstName,
          tlastName,
          temailAddress,
          tphoneNumber,
          tlargeBoxSizeCount,
          tmediumBoxSizeCount,
          tsmallBoxSizeCount,
          tlocationName,
          tapartmentName,
          troomNumber,
          taddress,
          tcost);

      //assert
      verify(mockNetworkInfo.isConnected);
    });
  });

  group('device is online', () {
    setUp(() {
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    });

    test('should send the info to the database', () async {
      //arrange
      when(mockServerHost.sendUserRequest(
              tfirstName,
              tlastName,
              temailAddress,
              tphoneNumber,
              tlargeBoxSizeCount,
              tmediumBoxSizeCount,
              tsmallBoxSizeCount,
              tlocationName,
              tapartmentName,
              troomNumber,
              taddress,
              tcost))
          .thenAnswer((_) async => tUserRequest);

      //act
      final result = await repository!.sendUserRequest(
          tfirstName,
          tlastName,
          temailAddress,
          tphoneNumber,
          tlargeBoxSizeCount,
          tmediumBoxSizeCount,
          tsmallBoxSizeCount,
          tlocationName,
          tapartmentName,
          troomNumber,
          taddress,
          tcost);

      //assert
      verifyNever(mockServerHost.sendUserRequest(
          tfirstName,
          tlastName,
          temailAddress,
          tphoneNumber,
          tlargeBoxSizeCount,
          tmediumBoxSizeCount,
          tsmallBoxSizeCount,
          tlocationName,
          tapartmentName,
          troomNumber,
          taddress,
          tcost));
      expect(result, equals(Right(tUserRequest)));
    });
  });
}
