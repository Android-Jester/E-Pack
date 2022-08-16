import 'package:e_pack_final/core/core_usage/presentation/function/page_movement.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/dialog_states.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/options/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../provider/bloc/storage_cubit.dart';

class StoragePeriod extends StatefulWidget {
  final PageController controller;
  final ScrollController scroll;
  final int currentPage;
  StoragePeriod({
    Key? key,
    required this.scroll,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _RoomTypeState createState() => _RoomTypeState();
}

class _RoomTypeState extends State<StoragePeriod>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocConsumer<StorageCubit, StorageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ContainerWrapper(
              child: Column(
            children: [
              Center(
                child: Text(
                  "SELECT the number of weeks you prefer to store your items for",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              SizedBox(
                height: itemHeight(15),
              ),
              Row(
                children: [
                  Selectors(
                    name: "Weeks Stored",
                    textEditingController: data.storagePeriodController,
                  ),
                  const Text("Weeks"),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  const Text("Total Cost: "),
                  const Spacer(),
                  Text("GH\$ ${data.cost}")
                ],
              ),
              //TODO: MOVE TO NEXT SCREEN
              ButtonRow(
                  pageController: widget.controller,
                  currentPage: widget.currentPage,
                  scroll: widget.scroll,
                  nextAction: () {
                    if (data.storagePeriodController !=
                        TextEditingController(text: "0")) {
                      direction(widget.controller, widget.scroll,
                          widget.currentPage, true);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const WarningDialog(
                            text: "Please set the time period"),
                      );
                    }
                  })
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
