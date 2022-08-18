import 'package:equatable/equatable.dart';

import '../../domain/entities/initialize_response_entity.dart';

class InitializeResponseModel extends InitializeResponseEntity {
  const InitializeResponseModel({required bool status, required Map<String, dynamic> data}) : super(status: status, data: data);


  factory InitializeResponseModel.fromJSON(Map<String, dynamic> json) => InitializeResponseModel(status: json['status'], data: json['data']);

  @override
  List<Object?> get props => [];


}