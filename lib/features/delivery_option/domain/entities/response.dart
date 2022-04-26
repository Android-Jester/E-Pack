import 'package:equatable/equatable.dart';

class DeliveryResponse extends Equatable {
  final String deliveryKey;

  DeliveryResponse({required this.deliveryKey});

  @override
  List<Object?> get props => [
        deliveryKey,
      ];
}
