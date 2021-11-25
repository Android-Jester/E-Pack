import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/button_row.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/presentation/components/body.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      {required String? text, required int? value, required int groupValue, required RelocationDetailsInfo data, double sizeWidth = 15}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: itemWidth(15.0), vertical: itemHeight(20.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          text!,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: itemWidth(sizeWidth)),
        ),
        Radio<int>(
          value: value!,
          groupValue: groupValue,
          onChanged: (valued) => data.setRelocationValue(valued!),
        ),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    return Consumer<RelocationDetailsInfo>(
      builder: (context, data, child) {
        return ContainerWrapper(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              selectionRow(text: "Deliver to my House: (around Kumasi only)", value: 1, data: data, groupValue: data.relocationValue),
              selectionRow(text: "Deliver to another address on same campus", data: data, value: 2, groupValue: data.relocationValue),
              selectionRow(text: "Deliver to a different campus address", value: 3, data: data, groupValue: data.relocationValue),
              selectionRow(text: "Deliver to another room in the same building", value: 4, data: data, groupValue: data.relocationValue),
              buttonRow(
                widget.controller!,
                widget.currentPage,
                nextButton: () {
                  smoothScrollToTop(widget.scroll);
                  (data.relocationValue == 0) ? null : direction(widget.controller!, widget.currentPage, true);
                },
              )
            ],
          ),
        );
      },
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
