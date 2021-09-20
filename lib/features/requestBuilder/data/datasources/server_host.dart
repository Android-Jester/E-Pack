import 'package:appwrite/appwrite.dart';
import 'package:e_pack/features/requestBuilder/data/models/user_request.dart';
import 'package:e_pack/features/requestBuilder/data/repositories/user_request_repo_impl.dart';

class ServerHost {
  late Database database;
  final UserRequest? request;
  ServerHost(Client client, {required this.request}) {
    database = Database(client);
    Future result = database.createDocument(
      collectionId: '60f4529c27565',
      data: UserRequestRepoImpl(request!).sendUserRequest(),
    );
  }
}
