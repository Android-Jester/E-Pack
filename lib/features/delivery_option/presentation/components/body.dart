import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/config/theme.dart';
import 'package:e_pack/core/presentation/widgets/sliver_deligate.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/box_choices.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/collect_location.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/contact_info.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/relocation_details.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/room_type.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/time_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
        SizedBox(height: itemHeight(10.0)),
        SizedBox(
          height: Config.height! / 1.05,
          width: Config.width,
          child: NestedScrollView(
            body: KeyboardVisibilityBuilder(
              builder: (BuildContext context, bool isKeyboardVisible) {
                return SingleChildScrollView(
                  child: Container(
                    height: Config.height,
                    child: PageView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      onPageChanged: (value) =>
                          setState(() => currentPage = value),
                      controller: _controller,
                      itemCount: pages.length,
                      itemBuilder: (context, indexed) => pages[indexed],
                    ),
                  ),
                );
              },
            ),
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverAppBar(
                pinned: false,
                bottom: AppBar(
                  elevation: 1.0,
                  backgroundColor:
                      (innerBoxIsScrolled) ? kAccentColor : Colors.transparent,
                  title: Text(
                    title[currentPage],
                  ),
                  centerTitle: true,
                ),
                centerTitle: true,
                elevation: 1.0,
                title: Text("Delivery Option"),
                backgroundColor: kPrimaryColor,
                floating: false,
                expandedHeight: itemHeight(150),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/images/box.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: Delegate(currentPage: currentPage, pages: pages),
              )
            ],
          ),
        ),
      ],
    );
  }
}
