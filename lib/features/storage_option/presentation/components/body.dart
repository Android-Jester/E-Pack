import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/sliver_deligate.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_box_choices.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_collection_info.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_contact_info.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_momo_payment.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_period.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_room_type.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_time_of_collection.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController? _controller = PageController();
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
    Config.init(context);
    List<Widget> pages = [
      StorageTimeSelection(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
      StorageRoomType(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
      StorageBoxChoices(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
      StoragePeriod(
        controller: _controller,
        currentPage: currentPage,
        scroll: _scrollControl,
      ),
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
      StorageMomoPayment(
        controller: _controller!,
        currentPage: currentPage,
        scroll: _scrollControl,
      )
    ];

    List<String> title = [
      "Time Selection",
      "Appartment Type",
      "Box Sizes",
      "Storage Period",
      "Collection Info",
      "Contact Info",
      "Mobile Money Payment"
    ];

    return Container(
      width: Config.width,
      child: NestedScrollView(
        floatHeaderSlivers: true,
        controller: _scrollControl,
        physics: BouncingScrollPhysics(),
        body: SafeArea(
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) => setState(() => currentPage = value),
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, i) => pages[i],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
          SliverAppBar(
            snap: true,
            bottom: AppBar(
              leading: Container(
                color: Colors.transparent,
              ),
              elevation: 1.0,
              backgroundColor: (innerBoxIsScrolled) ? Theme.of(context).colorScheme.secondary : Colors.transparent,
              title: Text(
                title[currentPage],
              ),
              centerTitle: true,
            ),
            centerTitle: true,
            elevation: 1.0,
            title: Text("Storage Option"),
            backgroundColor: Theme.of(context).colorScheme.primary,
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
