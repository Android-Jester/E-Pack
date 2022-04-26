import 'package:e_pack_final/core/core_usage/presentation/widgets/box_selections/box_header.dart';
import 'package:e_pack_final/core/core_usage/presentation/widgets/box_selections/box_sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/widgets/box_selections/box_selector.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/dialog_states.dart';
import '../provider/bloc/delivery_cubit.dart';

class BoxChoices extends StatefulWidget {
  final PageController controller;
  final ScrollController scroll;
  final int currentPage;
  BoxChoices({
    Key? key,
    required this.scroll,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  _BoxChoicesState createState() => _BoxChoicesState();
}

class _BoxChoicesState extends State<BoxChoices> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<DeliveryCubit>(context);
    Config.init(context);
    return SingleChildScrollView(
      child: ContainerWrapper(
        padding: EdgeInsets.symmetric(vertical: itemWidth(35.0)),
        width: Config.width,
        child: Column(
          children: [
            const BoxHeader(),
            const Divider(),
            BoxesSelection(
              large: bloc.largeBoxController,
              medium: bloc.mediumBoxController,
              small: bloc.smallBoxController,
            ),
            const BoxSizes(),
            SizedBox(height: itemHeight(20.0)),
            ButtonRow(
                pageController: widget.controller,
                currentPage: widget.currentPage,
                scroll: widget.scroll,
                nextAction: () {
                  if (int.parse(bloc.largeBoxController.text) != 0 || int.parse(bloc.mediumBoxController.text) != 0 || int.parse(bloc.smallBoxController.text) != 0) {
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
    );
  }

  @override
  bool get wantKeepAlive => true;
}
