import 'package:e_pack/features/requestBuilder/data/models/user_request.dart';
import 'package:e_pack/features/requestBuilder/domain/repositories/user_request_repo.dart';

class UserRequestRepoImpl implements UserRequestRepo {
  @override
  late UserRequest request;

  UserRequestRepoImpl(this.request);
  @override
  late Map<String, dynamic> data;

  @override
  Map<String, dynamic> sendUserRequest() {
    data = {
      "firstName: ": request.firstName,
      "lastName": request.lastName,
      "emailAddress": request.emailAddress,
      "phoneNumber": request.phoneNumber,
      "largeBoxSizeCount": request.largeBoxSizeCount ?? 0,
      "mediumBoxSizeCount": request.mediumBoxSizeCount ?? 0,
      "smallBoxSizeCount": request.smallBoxSizeCount ?? 0,
      "locationName": request.locationName,
      "apartmentName": request.apartmentName,
      "roomNumber": request.roomNumber,
      "address": request.address,
      "cost": request.cost
    };
    return data;
  }
}
