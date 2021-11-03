import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RelocationDetails extends StatefulWidget {
  final PageController? controller;
  final int currentPage;
  RelocationDetails({
    Key? key,
    required this.controller,
    required this.currentPage,
  }) : super(key: key);

  @override
  State<RelocationDetails> createState() => _RelocationDetailsState();
}

class _RelocationDetailsState extends State<RelocationDetails>
    with AutomaticKeepAliveClientMixin {
  Widget selectionRow(
      {required String? text,
      required int? value,
      required int groupValue,
      required RelocationDetailsInfo data}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: itemWidth(20.0), vertical: itemHeight(20.0)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(text!),
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
        return Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: itemHeight(45.0)),
              selectionRow(
                  text: "Deliver to my House: (around Kumasi only)",
                  value: 1,
                  data: data,
                  groupValue: data.relocationValue),
              selectionRow(
                  text: "Deliver to another address on same campus",
                  data: data,
                  value: 2,
                  groupValue: data.relocationValue),
              selectionRow(
                  text: "Deliver to a different campus address",
                  value: 3,
                  data: data,
                  groupValue: data.relocationValue),
              selectionRow(
                  text: "Deliver to another room in the same building",
                  value: 4,
                  data: data,
                  groupValue: data.relocationValue),
              Center(
                child: PageButton(
                  isForward: false,
                  pageCount: widget.currentPage,
                  controller: widget.controller!,
                ),
              ),
              Center(
                child: PageButton(
                    isForward: true,
                    pageCount: widget.currentPage,
                    controller: widget.controller!,
                    isDisabled: (data.relocationValue == 0) ? true : false),
              ),
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
