//TODO: collection of location info

import 'package:e_pack_final/features/delivery_option/presentation/provider/bloc/delivery_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/configurations/theme.dart';
import '../../../../core/core_usage/presentation/function/page_movement.dart';
import '../../../../core/core_usage/presentation/widgets/check_boxes_agreement.dart';
import '../../../../core/core_usage/presentation/widgets/container_wrapper.dart';
import '../../../../core/core_usage/presentation/widgets/text_with_lable.dart';
import '../provider/bloc/storage_cubit.dart';
import '../widgets/form_column.dart';

class StorageCollectionInfo extends StatelessWidget {
  final PageController controller;
  final int currentPage;
  final ScrollController scroll;

  const StorageCollectionInfo({required this.controller, required this.currentPage, required this.scroll, Key? key}):super(key: key);

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    var data = BlocProvider.of<StorageCubit>(context);
    return BlocConsumer<StorageCubit, StorageState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: ContainerWrapper(
            width: Config.width,
            height: Config.height,
            child: Form(
              key: data.collectKey,
              child: Column(
                children: [
                  FormColumn(data: data),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: itemWidth(15.0)),
                    child: Text(
                      "Please enter any instruction that may confirm to the third party on our team's arriving to pack your items",
                      style: TextStyle(fontSize: itemWidth(17.0)),
                    ),
                  ),
                  CheckBoxesAgreements(cubit: data),
                  ButtonRow(
                      pageController: controller,
                      currentPage: currentPage,
                      scroll: scroll,
                      nextAction: () {
                    data.validation(context, scroll, controller, currentPage, data.collectKey);
                  })
                ],
              ),
            ),
          ),
        );
      },
      listener: (context, state) {

      }
    );
  }



  @override
  bool get wantKeepAlive => true;
}







