import 'package:equatable/equatable.dart';

class StorageRequestResponse extends Equatable {
  final bool successStatus;
  final String deliveryKey;

  StorageRequestResponse({
    required this.successStatus,
    required this.deliveryKey,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
    successStatus,
    deliveryKey,
  ];

}