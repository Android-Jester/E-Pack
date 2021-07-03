import 'package:e_pack/features/e-pack/domain/repositories/userInfoRepository.dart';
import 'package:e_pack/features/e-pack/domain/usecases/sendUserRequest.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockUserRequestInfo extends Mock implements UserRequestRepository {}

void main() {
  GetUserRequestInfo usecase;
  MockUserRequestInfo mockedInfo;

  setUp(() {
    mockedInfo = MockUserRequestInfo();
    usecase = GetUserRequestInfo(repo: mockedInfo);
    //arrange

    //assert

    //verify
  });
}
