import 'package:e_pack/features/e-pack/domain/entities/userRequest.dart';

abstract class UserRequestRemoteDataSource {
  Future<UserRequest> sendUserRequestInfo(
      String? firstName,
      String? lastName,
      String? emailAddress,
      String? phoneNumber,
      int? largeBoxSizeCount,
      int? mediumBoxSizeCount,
      int? smallBoxSizeCount,
      String? locationName,
      String? apartmentName,
      int? roomNumber,
      String? address,
      double? cost);
}
