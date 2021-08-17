import 'package:dartz/dartz.dart';
import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';
import 'package:e_pack/features/e-pack/domain/repositories/userInfoRepository.dart';
import 'package:e_pack/features/e-pack/domain/usecases/sendUserRequest.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'dart:ui';

class MockUserRequestInfo extends Mock implements UserRequestRepository {}

void main() {
  GetUserRequestInfo usecase;
  MockUserRequestInfo mockedInfo;

  setUp(() async {
    mockedInfo = MockUserRequestInfo();
    usecase = GetUserRequestInfo(repo: mockedInfo);

    //arrange
    final tfirstName = "Kwadwo";
    final tlastName = "Duah";
    final String temailAddress = "unknown@email.com";
    final tphoneNumber = "0241119708";
    final int tlargeBoxSizeCount = 0;
    final int tmediumBoxSizeCount = 1;
    final int tsmallBoxSizeCount = 2;
    final String tlocationName = "Ayeduase";
    final String tapartmentName = "FrontLine Hall";
    final int troomNumber = 318;
    final String taddress = "Ayeduase";
    final double tcost = 240;

    final tuserRequest = UserRequest(
      firstName: tfirstName,
      lastName: tlastName,
      emailAddress: temailAddress,
      phoneNumber: tphoneNumber,
      largeBoxSizeCount: tlargeBoxSizeCount,
      smallBoxSizeCount: tsmallBoxSizeCount,
      mediumBoxSizeCount: tmediumBoxSizeCount,
      locationName: tlocationName,
      apartmentName: tapartmentName,
      roomNumber: troomNumber,
      address: taddress,
      cost: tcost,
    );
    //arrange
    when(mockedInfo
        .sendUserRequestInfo(
          any,
          any,
          any,
          any,
          any,
          any,
          any,
          any,
          any,
          any,
          any,
          any,
        )
        .then((_) async => Right(tuserRequest)));
    //act
    final result = await usecase(Params(
      firstName: tfirstName,
      lastName: tlastName,
      emailAddress: temailAddress,
      phoneNumber: tphoneNumber,
      largeBoxSizeCount: tlargeBoxSizeCount,
      smallBoxSizeCount: tsmallBoxSizeCount,
      mediumBoxSizeCount: tmediumBoxSizeCount,
      locationName: tlocationName,
      apartmentName: tapartmentName,
      roomNumber: troomNumber,
      address: taddress,
      cost: tcost,
    ));
    //verify
  });
}
