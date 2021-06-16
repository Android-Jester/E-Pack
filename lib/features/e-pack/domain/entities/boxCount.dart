import 'package:equatable/equatable.dart';

class BoxCount extends Equatable{
  final int largeSize, mediumSize, smallSize;

  BoxCount({required this.largeSize,required this.mediumSize, required  this.smallSize});

  @override
  // TODO: implement props
  List<Object?> get props => [largeSize, mediumSize, smallSize];
}