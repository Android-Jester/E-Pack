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
  PageController _controller = PageController();
  int currentPage = 0;
  ScrollController _scrollControl = ScrollController();

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
    List<String> title = ["Time Selection", "Appartment Type", "Box Sizes", "Relocation Details", "Collection Info", "Destination Info", "Momo Info"];

    Config.init(context);
    List<Widget> pages = [
      TimeSelection(
        currentPage: currentPage,
        controller: _controller!,
        scroll: _scrollControl,
      ),
      RoomType(
        currentPage: currentPage,
        controller: _controller,
        scroll: _scrollControl,
      ),
      BoxChoices(
        currentPage: currentPage,
        controller: _controller,
        scroll: _scrollControl,
      ),
      RelocationDetails(
        currentPage: currentPage,
        controller: _controller,
        scroll: _scrollControl,
      ),
      CollectionData(
        currentPage: currentPage,
        controller: _controller,
        scroll: _scrollControl,
      ),
      ContactInfo(
        currentPage: currentPage,
        controller: _controller,
        scroll: _scrollControl,
      ),
      MomoInformation(
        _scrollControl,
        currentPage,
        _controller!,
      )
    ];

    return Container(
      width: Config.width,
      child: NestedScrollView(
        physics: BouncingScrollPhysics(),
        floatHeaderSlivers: true,
        controller: _scrollControl,
        body: SafeArea(
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) => setState(() => currentPage = value),
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, index) => pages[index],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            snap: true,
            bottom: AppBar(
              leading: Container(
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
              elevation: 1.0,
              backgroundColor: (innerBoxIsScrolled) ? Theme.of(context).colorScheme.secondaryVariant : Colors.transparent,
              title: Text(
                title[currentPage],
              ),
              centerTitle: true,
            ),
            centerTitle: true,
            elevation: 1.0,
            title: Text("Delivery Option"),
            backgroundColor: Theme.of(context).colorScheme.background,
            floating: true,
            pinned: true,
            expandedHeight: itemHeight(150),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "assets/images/box.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: false,
            delegate: Delegate(currentPage: currentPage, pages: pages),
          )
        ],
      ),
    );
  }
}

smoothScrollToTop(ScrollController scroll) {
  if (scroll.hasClients) {
    scroll.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }
}
