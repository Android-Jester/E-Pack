import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/page_header.dart';
import 'package:e_pack/features/storage_option/presentation/screens/box_choices.dart';
import 'package:e_pack/features/storage_option/presentation/screens/collect_location.dart';
import 'package:e_pack/features/storage_option/presentation/screens/contact_info.dart';
import 'package:e_pack/features/storage_option/presentation/screens/room_type.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_period.dart';
import 'package:e_pack/features/storage_option/presentation/screens/time_selection.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController? _controller = PageController();
  int selectedRadio = 0;
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
    Config.init(context);
    pages = [
      TimeSelection(
        controller: _controller,
        currentPage: currentPage,
      ),
      RoomType(
        controller: _controller,
        currentPage: currentPage,
      ),
      BoxChoices(
        controller: _controller,
        currentPage: currentPage,
      ),
      StoragePeriod(
        controller: _controller,
        currentPage: currentPage,
      ),
      CollectLocation(
        controller: _controller,
        currentPage: currentPage,
      ),
      ContactInfo(
        controller: _controller,
        currentPage: currentPage,
      )
    ];

    List<String> title = [
      "Time Selection",
      "Appartment Type",
      "Box Sizes",
      "Storage Period",
      "Collection Info",
      "Contact Info",
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
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
                key: widget.key,
                onPageChanged: (value) => setState(() => currentPage = value),
                controller: _controller,
                itemCount: pages.length,
                itemBuilder: (context, indexed) => pages[indexed],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
