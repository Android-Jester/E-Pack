import 'package:dartz/dartz.dart';
import 'package:e_pack/features/requestBuilder/domain/entities/user_request.dart';
import 'package:e_pack/features/requestBuilder/domain/repositories/user_request_repo.dart';
import 'package:e_pack/features/requestBuilder/domain/usecases/send_user_request.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'send_user_request_test.mocks.dart';

@GenerateMocks([UserRequestRepository])
void main() {
  SendUserRequest? usecase;
  var mockUserRequestRepository;

  setUp(() {
    mockUserRequestRepository = MockUserRequestRepository();
    usecase = SendUserRequest(mockUserRequestRepository!);
  });

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

  test("sends a request to the database", () async {
    when(mockUserRequestRepository!.sendUserRequest(
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
      tcost,
    )).thenAnswer((_) async {
      return Right(tUserRequest);
    });
    final result = await usecase!(Params(
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
        cost: tcost));
    expect(result, Right(tUserRequest));

    verify(mockUserRequestRepository!.sendUserRequest(
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
  });

  // verifyNoMoreInteractions(mockUserRequestRepository);
}
