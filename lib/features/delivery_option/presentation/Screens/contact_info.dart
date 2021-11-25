import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/background_wrapper.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/text_with_label.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/delivery_recepient_info.dart';
import 'package:e_pack/features/delivery_option/presentation/provider/relocation_details_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ContactInfo extends StatefulWidget {
  final PageController? controller;
  final int currentPage;
  final ScrollController scroll;

  ContactInfo({
    required this.scroll,
    required this.controller,
    required this.currentPage,
  });

  @override
  State<ContactInfo> createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> with AutomaticKeepAliveClientMixin {
  FocusNode node = FocusNode();

  @override
  void dispose() {}

  @override
  void initState() {
    super.initState();
    node = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    var controller = widget.controller;
    var currentPage = widget.currentPage;
    var scroll = widget.scroll;
    var choice = Provider.of<RelocationDetailsInfo>(context, listen: false).relocationValue;
    Config.init(context);
    return Consumer<DeliveryRecepientInfo>(builder: (context, data, widget) {
      return SingleChildScrollView(
        child: ContainerWrapper(
          height: Config.height,
          width: Config.width,
          child: Column(
            children: [
              SingleChildScrollView(
                child: Container(
                  width: Config.width,
                  height: Config.height! / 2,
                  child: Form(
                    key: data.key,
                    child: Column(
                      children: [
                        (choice == 4)
                            ? SizedBox(
                                height: itemHeight(0.1),
                              )
                            : TextWithLabel(
                                text: "Destination Address",
                                validate: (val) => data.validator(val!),
                                textCon: data.destinationAddressController,
                                type: TextInputType.streetAddress,
                              ),
                        (choice == 1 || choice == 2)
                            ? SizedBox(
                                height: itemHeight(0.1),
                              )
                            : TextWithLabel(
                                validate: (val) => data.validator(val!, isNumeric: true),
                                text: "Room Number",
                                textCon: data.roomNumberController,
                                type: TextInputType.number),
                        TextWithLabel(
                            validate: (val) => data.validator(val!),
                            text: "Contact Name",
                            textCon: data.contactNameController,
                            type: TextInputType.name),
                        TextWithLabel(
                            validate: (val) => data.validator(val!, isNumeric: true, isPhoneNumber: true),
                            text: "Contact Phone Number",
                            textCon: data.contactNumberController,
                            type: TextInputType.phone),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: itemWidth(20.0)),
                child: CustomButton(
                    width: Config.width!,
                    text: "Book Now",
                    onPressed: () {
                      data.validation(context, controller!, currentPage, scroll);
                    }),
              ),
            ],
          ),
        ),
      );
    });
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
