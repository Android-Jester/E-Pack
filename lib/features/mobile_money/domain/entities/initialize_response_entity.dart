import 'package:equatable/equatable.dart';

class InitializeResponseEntity extends Equatable {
  final bool status;
  final Map<String, dynamic> data;

  const InitializeResponseEntity({required this.status, required this.data});



  @override
  List<Object?> get props => [status, data];

}