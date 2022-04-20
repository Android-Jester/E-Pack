import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/function/scroll_movement.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../provider/bloc/delivery_cubit.dart';

class RelocationDetails extends StatefulWidget {
  final PageController? controller;
  final ScrollController scroll;
  final int currentPage;
  RelocationDetails({
    Key? key,
    required this.scroll,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<RelocationDetails> createState() => _RelocationDetailsState();
}

class _RelocationDetailsState extends State<RelocationDetails> with AutomaticKeepAliveClientMixin {
  Widget selectionRow(
      {required String? text, required int? value, required int groupValue, required DeliveryCubit data, double sizeWidth = 13.5}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(15.0), vertical: itemHeight(20.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          width: itemWidth(260),
          child: Text(
            text!,
            style: Theme.of(context).textTheme.bodyText1!,
            softWrap: true,
          ),
        ),
        Radio<int>(
          value: value!,
          groupValue: groupValue,
          onChanged: (valued) => data.relocationValue = valued!,
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    var data = BlocProvider.of<DeliveryCubit>(context);
    Config.init(context);
    return ContainerWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectionRow(
                text: "Deliver to my House: (around Kumasi only)",
                value: 1,
                data: data,
                groupValue: data.relocationValue,
              ),
              selectionRow(
                text: "Deliver to another address on same campus",
                data: data,
                value: 2,
                groupValue: data.relocationValue,
              ),
              selectionRow(text: "Deliver to a different campus address", value: 3, data: data, groupValue: data.relocationValue),
              selectionRow(text: "Deliver to another room in the same building", value: 4, data: data, groupValue: data.relocationValue),
              ButtonRow(
                pageController: widget.controller!,
                currentPage: widget.currentPage,
                scroll: widget.scroll,
                nextAction: () {
                  (data.relocationValue == 0) ? null : direction(widget.controller!, widget.scroll, widget.currentPage, true);
                },
              )
            ],
          ),
        );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
