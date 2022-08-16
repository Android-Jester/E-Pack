import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/widgets/box_selections/box_header.dart';
import '../../../../core/core_usage/presentation/widgets/box_selections/box_selector.dart';
import '../../../../core/core_usage/presentation/widgets/box_selections/box_sizes.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/dialog_states.dart';
import '../provider/bloc/storage_cubit.dart';

class StorageBoxChoices extends StatefulWidget {
  final PageController controller;
  final ScrollController scroll;
  final int currentPage;
  const StorageBoxChoices({
    Key? key,
    required this.scroll,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _BoxChoicesState createState() => _BoxChoicesState();
}

class _BoxChoicesState extends State<StorageBoxChoices> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocBuilder<StorageCubit, StorageState>(
      bloc: data,
      builder: (context, state) => SingleChildScrollView(
        child: ContainerWrapper(
          padding: EdgeInsets.symmetric(vertical: itemWidth(35.0)),
          width: Config.width,
          child: Column(
            children: [
              const BoxHeader(),
              BoxesSelection(
                large: data.largeBoxController,
                medium: data.mediumBoxController,
                small: data.smallBoxController,
              ),
              const BoxSizes(),
              SizedBox(height: itemHeight(20.0)),
              ButtonRow(
                  pageController: widget.controller,
                  currentPage: widget.currentPage,
                  scroll: widget.scroll,
                  nextAction: () {
                if (int.parse(data.largeBoxController.text) != 0 || int.parse(data.mediumBoxController.text) != 0 || int.parse(data.smallBoxController.text) != 0) {
                  direction(widget.controller, widget.scroll, widget.currentPage, true);
                } else {
                  showDialog(
                    context: context,
                    builder: (context) => WarningDialog(text: "Please select at least one box"),
                  );
                }
              })
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}




