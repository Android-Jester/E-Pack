import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/page_header.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/box_choices.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/collect_location.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/contact_info.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/relocation_details.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/room_type.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/time_selection.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int count = 0;
  PageController? _controller = PageController();
  int currentPage = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      "Time Selection",
      "Appartment Type",
      "Box Sizes",
      "Relocation Details",
      "Collection Info",
      "Destination Info",
    ];

    Config.init(context);
    pages = [
      TimeSelection(
        currentPage: currentPage,
        controller: _controller,
      ),
      RoomType(
        currentPage: currentPage,
        controller: _controller,
      ),
      BoxChoices(
        currentPage: currentPage,
        controller: _controller,
      ),
      RelocationDetails(
        currentPage: currentPage,
        controller: _controller,
      ),
      DeliveryInfo(
        currentPage: currentPage,
        controller: _controller,
      ),
      ContactInfo(
        currentPage: currentPage,
        controller: _controller,
      ),
    ];

    return Column(
      children: [
        Expanded(
            flex: 1,
            child: PageHeader(
              currentPage: currentPage,
              pages: pages,
              title: title[currentPage],
            )),
        Expanded(
          flex: 3,
          child: PageView.builder(
            onPageChanged: (value) => setState(() => currentPage = value),
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, indexed) => pages[indexed],
          ),
        ),
      ],
    );
  }
}
