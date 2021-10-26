import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/page_header.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/box_choices.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/collect_location.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/contact_info.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/room_type.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/storage_period.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/time_selection.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int count = 0;
  PageController? _controller = PageController();
  DateRangePickerController? _dateController;
  TextEditingController? semesterPeriod;
  TextEditingController? largeBoxController = TextEditingController(text: "0");
  TextEditingController? mediumBoxController = TextEditingController(text: "0");
  TextEditingController? smallBoxController = TextEditingController(text: "0");
  int selectedRadio = 0;
  // String  = "First Semester";
  int currentPage = 0;
  late List<Widget> pages;
  buttonRow() {
    return (currentPage == pages.length)
        ? PageButton(
            isForward: false,
            pageCount: currentPage,
            controller: _controller,
          )
        : (currentPage == 0)
            ? PageButton(
                isForward: true,
                pageCount: currentPage,
                controller: _controller,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  PageButton(
                    isForward: false,
                    pageCount: currentPage,
                    controller: _controller,
                  ),
                  PageButton(
                    isForward: true,
                    pageCount: currentPage,
                    controller: _controller,
                  ),
                ],
              );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
    largeBoxController!.dispose();
    mediumBoxController!.dispose();
    smallBoxController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    pages = [
      TimeSelection(
        controller: _controller,
        dateController: _dateController,
      ),
      const RoomType(),
      BoxChoices(
        largeBoxController: largeBoxController,
        smallBoxController: smallBoxController,
        mediumBoxController: mediumBoxController,
      ),
      StoragePeriod(),
      CollectLocation(),
      ContactInfo()
    ];

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            PageHeader(currentPage: currentPage, pages: pages),
            Container(
              height: Config.height! / 1.5,
              width: Config.width,
              child: PageView.builder(
                onPageChanged: (value) => setState(() => currentPage = value),
                controller: _controller,
                itemCount: pages.length,
                itemBuilder: (context, indexed) => pages[indexed],
              ),
            ),
            buttonRow(),
            if (currentPage == pages.length)
              CustomButton(
                onPressed: () {},
                // onPressed: () => Navigator.pushNamed(context, Page3.id),
                text: 'Book Now',
              )
          ],
        ),
      ),
    );
  }
}
