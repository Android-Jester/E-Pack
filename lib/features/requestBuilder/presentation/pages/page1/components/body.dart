import 'package:e_pack/features/requestBuilder/data/models/user_request_model.dart';
import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page1/screen6.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/page_header.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/radio_button.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../screen1.dart';
import '../screen2.dart';
import '../screen3.dart';
import '../screen4.dart';
import '../screen5.dart';

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
      Screen1(
        controller: _controller,
        dateController: _dateController,
      ),
      const Screen2(),
      Screen3(
        largeBoxController: largeBoxController,
        smallBoxController: smallBoxController,
        mediumBoxController: mediumBoxController,
      ),
      Screen4(),
      Screen5(),
      Screen6()
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
                onPressed: () {
                  UserRequestModel(
                    firstName: firstName,
                    lastName: lastName,
                    emailAddress: emailAddress,
                    timeDeposition: timeDeposition,
                    semesterPeriod: semesterPeriod,
                    largeBoxSizeCount: largeBoxSizeCount,
                    mediumBoxSizeCount: mediumBoxSizeCount,
                    smallBoxSizeCount: smallBoxSizeCount,
                    roomType: roomType,
                    storageWeeks: storageWeeks,
                    residenceName: residenceName,
                    roomNumber: roomNumber,
                    phoneNumber: phoneNumber,
                    addressType: addressType,
                    accessNote: accessNote,
                    locationName: locationName,
                    localPhoneNum: localPhoneNum,
                    whatsPhoneNum: whatsPhoneNum,
                    contactTimes: contactTimes,
                    momoFullName: momoFullName,
                    momoPhoneNum: momoPhoneNum,
                    cost: cost,
                  ).toJson();
                },
                // onPressed: () => Navigator.pushNamed(context, Page3.id),
                text: 'Book Now',
              )
          ],
        ),
      ),
    );
  }
}
