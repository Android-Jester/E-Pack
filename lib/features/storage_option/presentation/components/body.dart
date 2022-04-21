import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_usage/presentation/configurations/sizes.dart';
import '../../../../core/core_usage/presentation/widgets/functional_header.dart';
import '../screens/storage_box_choices.dart';
import '../screens/storage_collection_info.dart';
import '../screens/storage_contact_info.dart';
import '../screens/storage_time_of_collection.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _controller = PageController();
  int currentPage = 0;
  ScrollController _scrollControl = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    List<Widget> pages = [
      StorageTimeSelection(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
      // StorageRoomType(
      //   controller: _controller,
      //   currentPage: currentPage,
      //   scroll: _scrollControl,
      // ),
      StorageBoxChoices(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
      // StoragePeriod(
      //   controller: _controller,
      //   currentPage: currentPage,
      //   scroll: _scrollControl,
      // ),
      StorageCollectionInfo(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
      StorageContactInfo(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
    ];

    List<String> title = [
      "Time Selection",
      // "Appartment Type",
      "Box Sizes",
      // "Storage Period",
      "Collection Info",
      "Contact Info",
      "Mobile Money Payment"
    ];

    return Column(
      children: [
        Header(
            mainTitle: "Storage Option",
            title: title[currentPage]),
        Expanded(
          child: PageView.builder(
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (value) => setState(() => currentPage = value),
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, i) => pages[i],
          ),
        ),
      ],
    );
  }
}
