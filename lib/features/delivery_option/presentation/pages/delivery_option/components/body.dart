import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/page_header.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/delivery_option/data/datasources/server_host.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/box_choices.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/collect_location.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/contact_info.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/relocation_details.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/room_type.dart';
import 'package:e_pack/features/delivery_option/presentation/pages/delivery_option/Screens/time_selection.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Body extends StatefulWidget {
  String? _timeCollect, _semesterPeriod, _collectRoomType;
  int? _largeBoxSizeCount, _mediumBoxSizeCount, _smallBoxSizeCount;
  int? _relocateInfo;
  String? _residenceName;
  int? _roomNumber;
  String? _phoneNumber;
  String? _addressType;
  String? _accessNote;
  String? _destinationAddress;
  int? _destinationRoomNumber;
  String? _contactName, _contactPhoneNum;
  String? _momoFullName, _momoPhoneNum;
  double? _cost;

  String? get timeCollect => _timeCollect;

  Body({Key? key}) : super(key: key);
  void setTimeCollect(String input) => _timeCollect = input;
  void setSemesterPeriod(String input) => _semesterPeriod = input;
  void setCollectRoomType(String input) => _collectRoomType = input;
  void setLargeBoxSizeCount(int input) => _largeBoxSizeCount = input;
  void setMediumBoxSizeCount(int input) => _mediumBoxSizeCount = input;
  void setSmallBoxSizeCount(int input) => _smallBoxSizeCount = input;
  void setRelocateInfo(int input) => _relocateInfo = input;
  void setResidenceName(String input) => _residenceName = input;
  void setRoomNumber(int input) => _roomNumber = input;

  void setPhoneNumber(String input) => _phoneNumber = input;
  void setAddressType(String input) => _addressType = input;
  void setAccessNote(String input) => _accessNote = input;

  void setDestinationAddress(String input) => _destinationAddress = input;
  void setDestinationRoomNumber(int input) => _destinationRoomNumber = input;
  void setMomoFullName(String input) => _momoFullName = input;
  void setMomoPhoneNum(String input) => _momoPhoneNum = input;

  void setContactName(String input) => _contactName = input;
  void setContactPhoneNum(String input) => _contactPhoneNum = input;

  @override
  _BodyState createState() => _BodyState();

  String? get semesterPeriod => _semesterPeriod;
  String? get collectRoomType => _collectRoomType;
  int? get largeBoxSizeCount => _largeBoxSizeCount;
  int? get mediumBoxSizeCount => _mediumBoxSizeCount;
  int? get smallBoxSizeCount => _smallBoxSizeCount;
  int? get relocateInfo => _relocateInfo;
  String? get residenceName => _residenceName;
  int? get roomNumber => _roomNumber;
  String? get phoneNumber => _phoneNumber;
  String? get addressType => _addressType;
  String? get accessNote => _accessNote;
  String? get destinationAddress => _destinationAddress;
  int? get destinationRoomNumber => _destinationRoomNumber;
  String? get contactName => _contactName;
  String? get contactPhoneNum => _contactPhoneNum;
  String? get momoFullName => _momoFullName;
  String? get momoPhoneNum => _momoPhoneNum;
  double? get cost => _cost;
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
    Body body = Body();
    Config.init(context);
    pages = [
      TimeSelection(
        body: body,
      ),
      RoomType(
        body: body,
      ),
      BoxChoices(body: body),
      RelocationDetails(body: body),
      DeliveryInfo(body: body),
      ContactInfo(body: body),
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
                  ServerHostImpl().sendDeliveryRequest(
                      body.timeCollect,
                      body.semesterPeriod,
                      body.largeBoxSizeCount,
                      body.mediumBoxSizeCount,
                      body.smallBoxSizeCount,
                      body.relocateInfo,
                      body.residenceName,
                      body.collectRoomType,
                      body.roomNumber,
                      body.phoneNumber,
                      body.addressType,
                      body.accessNote,
                      body.destinationAddress,
                      body.destinationRoomNumber,
                      body.contactName,
                      body.contactPhoneNum,
                      body.momoFullName,
                      body.momoPhoneNum,
                      body.cost);
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
