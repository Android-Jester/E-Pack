import 'package:e_pack_final/core/core_usage/presentation/function/page_movement.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/dialog_states.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/options/selectors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/page_directions.dart';
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
        if (state is StorageInitial) {
          return SingleChildScrollView(
            child: ContainerWrapper(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: itemWidth(20)),
                  child: Center(
                    child: Text(
                      "Select the number of weeks you prefer to store your items for",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ),
                ),
                Selectors(
                  name: "Number of Weeks",
                  textEditingController: data.storagePeriodController,
                  onPressed: () =>
                    setState(() {
                      data.calculateCost();
                    }),
                ),
                SizedBox(
                  height: itemHeight(30),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: itemHeight(10), horizontal: itemWidth(35)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text("Total Cost"),
                      Text("GHs ${data.cost}"),
                    ],
                  ),
                ),
                SizedBox(
                  height: itemHeight(30),
                ),
                ButtonRow(
                    pageController: widget.controller,
                    currentPage: widget.currentPage,
                    scroll: widget.scroll,
                    nextAction: () {
                      if (int.parse(data.storagePeriodController.text) > 0) {
                        direction(widget.controller, widget.scroll, widget.currentPage, true);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) => const WarningDialog(text: "Please select at least one box"),
                        );
                      }
                    })
              ],
            )),
          );
        } else {
          return Container();
        }
      },
      listener: (context, state) {},
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
