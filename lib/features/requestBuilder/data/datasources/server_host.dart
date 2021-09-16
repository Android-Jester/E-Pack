import 'package:appwrite/appwrite.dart';
import 'package:e_pack/features/requestBuilder/data/models/user_request.dart';

class ServerHost {
  late Database database;
  final UserRequest? request;
  ServerHost(Client client, {required this.request}) {
    database = Database(client);
    Future result = database.createDocument(
      collectionId: '60f4529c27565',
      data: {
        "firstName: ": request!.firstName,
        "lastName": request!.lastName,
        "emailAddress": request!.emailAddress,
        "phoneNumber": request!.phoneNumber,
        "largeBoxSizeCount": request!.largeBoxSizeCount ?? 0,
        "mediumBoxSizeCount": request!.mediumBoxSizeCount ?? 0,
        "smallBoxSizeCount": request!.smallBoxSizeCount ?? 0,
        "locationName": request!.locationName,
        "apartmentName": request!.apartmentName,
        "roomNumber": request!.roomNumber,
        "address": request!.address,
        "cost": request!.cost
      },
    );
  }
}
