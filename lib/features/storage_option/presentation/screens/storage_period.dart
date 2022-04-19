import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../provider/bloc/storage_cubit.dart';

class StoragePeriod extends StatefulWidget {
  final PageController? controller;
  final ScrollController scroll;
  final int? currentPage;
  StoragePeriod({
    Key? key,
    required this.scroll,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<StoragePeriod> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocConsumer<StorageCubit, StorageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ContainerWrapper(
              child: Column(
            children: const [
              //TODO: LABEL
              //TODO: COUNTER
              //TODO: SUM COST
              //TODO: MOVE TO NEXT SCREEN
            ],
          )),
        );
      },
      listener: (context, state) {},
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
