import 'dart:convert';

import 'package:e_pack/features/requestBuilder/data/models/user_request.dart';

abstract class UserRequestRepo {
  late UserRequest request;
  late Map<String, dynamic> data;
  UserRequestRepo(this.request);

  Map<String, dynamic> sendUserRequest() {
        return data;
}
