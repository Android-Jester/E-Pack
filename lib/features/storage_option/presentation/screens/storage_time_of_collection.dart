import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/function/date_change.dart';
import '../../../../core/core_usage/presentation/function/date_time.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/page_directions.dart';
import '../provider/bloc/storage_cubit.dart';

class StorageTimeSelection extends StatefulWidget {
  final PageController controller;
  late final int currentPage;
  final ScrollController scroll;
  StorageTimeSelection({
    required this.controller,
    required this.currentPage,
    required this.scroll,
  });

  @override
  State<StorageTimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<StorageTimeSelection> with AutomaticKeepAliveClientMixin {
  DateRangePickerController? dateController = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var data = BlocProvider.of<StorageCubit>(context, listen: true);
    return BlocConsumer<StorageCubit, StorageState>(
        builder: (context, state) => SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: ContainerWrapper(
                padding: EdgeInsets.symmetric(vertical: itemHeight(25.0)),
                child: Form(
                  key: data.initialKey,
                  child: Column(
                    children: [
                      const Text("Pick A Slot", style: TextStyle(fontSize: 30.0)),
                      const SizedBox(height: 5.0),
                      // Date Time Picker
                      DateTimePicker(
                        dateController: dateController!,
                        onSelectionChanged: (val) => setState(() => onDateChange(val.value.toString(), data)),
                        endDate: DateTime(2022, 05, 15, 18, 00),
                      ),
                      SizedBox(height: itemHeight(15.0)),
                      SizedBox(
                        height: itemHeight(100.0),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
                          child: TextFormField(
                            controller: data.timeDate,
                            readOnly: true,
                            showCursor: false,
                            validator: (val) => data.textValidator(val!),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: "Please select a date to view Timeslot here",
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(itemWidth(12.0)))),
                          ),
                        ),
                      ),
                      PageButton(true, onPressed: () {
                        print("press");
                        data.validation(context, widget.scroll, widget.controller, widget.currentPage, data.initialKey);
                      }),
                    ],
                  ),
                ),
              ),
            ),
        listener: (context, state) {},
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
