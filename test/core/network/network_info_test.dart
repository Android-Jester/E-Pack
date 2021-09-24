import 'package:e_pack/core/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'network_info_test.mocks.dart';

@GenerateMocks([InternetConnectionChecker])
void main() {
  NetworkInfoImpl? networkInfo;
  MockInternetConnectionChecker? mockNetworkInfo;
  setUp(() {
    mockNetworkInfo = MockInternetConnectionChecker();
    networkInfo = NetworkInfoImpl(mockNetworkInfo!);
  });

  group("is connected", () {
    test('should forward call to InternetConnectionChecker.hasconnection', () async {
      final tHasConnectionFuture = Future.value(true);

      when(mockNetworkInfo!.hasConnection).thenAnswer((_) => tHasConnectionFuture);

      final result = networkInfo!.isConnected;

      verify(mockNetworkInfo!.hasConnection);
      expect(result, tHasConnectionFuture);
    });
  });
}
