import 'package:equatable/equatable.dart';

class Exceptions extends Equatable {
  @override
  List<Object?> get props => [];
}

class ServerException extends Exceptions {}
class LocalServerException extends Exceptions {}
class PaymentServerException extends Exceptions {}

class LocalException extends Exceptions {}
class DeviceLocalException extends Exceptions {}
