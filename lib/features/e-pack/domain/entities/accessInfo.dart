import 'package:equatable/equatable.dart';


class AccessInfo extends Equatable {
  final String address, location, roomNumber;

  AccessInfo({required this.address, required this.location, required this.roomNumber});



  @override
  // TODO: implement props
  List<Object?> get props => [address, location, roomNumber];

}