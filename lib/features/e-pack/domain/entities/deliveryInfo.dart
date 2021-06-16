import 'package:equatable/equatable.dart';






class DeliveryInfo extends Equatable{
  final String apartmentName;
  final int roomNumber;
  final String address, contactName;

  DeliveryInfo(this.apartmentName, this.roomNumber, this.address, this.contactName);

  @override
  // TODO: implement props
  List<Object?> get props => [apartmentName, roomNumber, address, contactName];
}