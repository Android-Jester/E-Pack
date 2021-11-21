import 'package:e_pack/core/presentation/config/colors.dart';
import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/sliver_deligate.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/box_choices.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/collect_location.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/contact_info.dart';
import 'package:e_pack/features/delivery_option/presentation/Screens/momo_information.dart';
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
  PageController? _controller = PageController();
  int currentPage = 0;

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
      "Momo Info"
    ];

    Config.init(context);
    List<Widget> pages = [
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
      CollectionPage(
        currentPage: currentPage,
        controller: _controller,
      ),
      ContactInfo(
        currentPage: currentPage,
        controller: _controller,
      ),
      MomoInformation()
    ];

    return Column(
      children: [
        SizedBox(height: itemHeight(10.0)),
        Expanded(
          child: Container(
            height: Config.height,
            width: Config.width,
            child: NestedScrollView(
              body: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                onPageChanged: (value) => setState(() => currentPage = value),
                controller: _controller,
                itemCount: pages.length,
                itemBuilder: (context, indexed) => pages[indexed],
              ),
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) => [
                SliverAppBar(
                  pinned: true,
                  bottom: AppBar(
                    leading: Container(
                      color: Colors.transparent,
                    ),
                    elevation: 1.0,
                    backgroundColor: (innerBoxIsScrolled)
                        ? kAccentColor
                        : Colors.transparent,
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
        ),
      ],
    );
  }
}
