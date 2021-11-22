import 'package:e_pack/core/presentation/config/colors.dart';
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
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController? _controller = PageController();
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
      StorageTimeSelection(
        controller: _controller,
        currentPage: currentPage,
      ),
      StorageRoomType(
        controller: _controller,
        currentPage: currentPage,
      ),
      StorageBoxChoices(
        controller: _controller,
        currentPage: currentPage,
      ),
      StoragePeriod(
        controller: _controller,
        currentPage: currentPage,
      ),
      StorageCollectionInfo(
        controller: _controller,
        currentPage: currentPage,
      ),
      StorageContactInfo(
        controller: _controller,
        currentPage: currentPage,
      ),
      StorageMomoPayment()
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

    return NestedScrollView(
      body: SingleChildScrollView(
        child: Container(
          height: Config.height,
          child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            onPageChanged: (value) => setState(() => currentPage = value),
            controller: _controller,
            itemCount: pages.length,
            itemBuilder: (context, i) => pages[i],
          ),
        ),
      ),
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        SliverAppBar(
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
          title: Text("Storage Option"),
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
          floating: true,
          delegate: Delegate(currentPage: currentPage, pages: pages),
        )
      ],
    );
  }
}
