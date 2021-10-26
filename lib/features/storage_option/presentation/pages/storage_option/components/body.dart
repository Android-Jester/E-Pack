import 'package:e_pack/core/presentation/config/config.dart';
import 'package:e_pack/core/presentation/widgets/custom_button.dart';
import 'package:e_pack/core/presentation/widgets/page_header.dart';
import 'package:e_pack/core/presentation/widgets/radio_button.dart';
import 'package:e_pack/features/storage_option/data/datasources/server_host.dart';
import 'package:e_pack/features/storage_option/presentation/screens/box_choices.dart';
import 'package:e_pack/features/storage_option/presentation/screens/collect_location.dart';
import 'package:e_pack/features/storage_option/presentation/screens/contact_info.dart';
import 'package:e_pack/features/storage_option/presentation/screens/room_type.dart';
import 'package:e_pack/features/storage_option/presentation/screens/storage_period.dart';
import 'package:e_pack/features/storage_option/presentation/screens/time_selection.dart';
import 'package:flutter/material.dart';

class Body extends StatefulWidget {
  String? _timeCollect, _semesterPeriod, _collectRoomType;
  int? _largeBoxSizeCount, _mediumBoxSizeCount, _smallBoxSizeCount;
  int? _storageWeeks;
  String? _residenceName;
  int? _roomNumber;
  String? _phoneNumber;
  String? _addressType;
  String? _accessNote;
  String? _locationName;
  String? _localPhoneNum, _whatsPhoneNum;
  int? _contactTimes;
  String? _momoFullName, _momoPhoneNum;
  double? cost;
  void setTimeCollect(String input) => _timeCollect = input;
  void setSemesterPeriod(String input) => _semesterPeriod = input;
  void setCollectRoomType(String input) => _collectRoomType = input;
  void setResidenceName(String input) => _residenceName = input;
  void setPhoneNumber(String input) => _phoneNumber = input;
  void setAddressType(String input) => _addressType = input;
  void setAccessNote(String input) => _accessNote = input;
  void setLocationName(String input) => _locationName = input;
  void setLocalPhoneNum(String input) => _localPhoneNum = input;
  void setWhatsPhoneNum(String input) => _whatsPhoneNum = input;
  void setMomoFullName(String input) => _momoFullName = input;
  void setMomoPhoneNum(String input) => _momoPhoneNum = input;
  void setLargeBoxSizeCount(int input) => _largeBoxSizeCount = input;
  void setMediumBoxSizeCount(int input) => _mediumBoxSizeCount = input;
  void setSmallBoxSizeCount(int input) => _smallBoxSizeCount = input;
  void setRoomNumber(int input) => _roomNumber = input;
  void setContactTimes(int input) => _contactTimes = input;
  void setStorageWeeks(int input) => _storageWeeks = input;

  String? get timeCollect => _timeCollect;

  @override
  _BodyState createState() => _BodyState();

  String? get semesterPeriod => _semesterPeriod;
  String? get collectRoomType => _collectRoomType;
  int? get largeBoxSizeCount => _largeBoxSizeCount;
  int? get mediumBoxSizeCount => _mediumBoxSizeCount;
  int? get smallBoxSizeCount => _smallBoxSizeCount;
  int? get storageWeeks => _storageWeeks;
  String? get residenceName => _residenceName;
  int? get roomNumber => _roomNumber;
  String? get phoneNumber => _phoneNumber;
  String? get addressType => _addressType;
  String? get accessNote => _accessNote;
  String? get locationName => _locationName;
  String? get localPhoneNum => _localPhoneNum;
  String? get whatsPhoneNum => _whatsPhoneNum;
  int? get contactTimes => _contactTimes;
  String? get momoFullName => _momoFullName;
  String? get momoPhoneNum => _momoPhoneNum;
}

class _BodyState extends State<Body> {
  int count = 0;
  PageController? _controller = PageController();
  int selectedRadio = 0;
  // String  = "First Semester";
  int currentPage = 0;
  Body body = Body();

  late List<Widget> pages;
  buttonRow() {
    return (currentPage == (pages.length - 1))
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
  }

  @override
  Widget build(BuildContext context) {
    Config.init(context);
    pages = [
      TimeSelection(
        controller: _controller,
        body: body,
      ),
      RoomType(
        body: body,
      ),
      BoxChoices(
        body: body,
      ),
      StoragePeriod(
        body: body,
      ),
      CollectLocation(
        body: body,
      ),
      ContactInfo(
        body: body,
      )
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
            CustomButton(
              onPressed: () {
                ServerHostImpl().sendStorageRequest(
                  body.timeCollect,
                  body.semesterPeriod,
                  body.collectRoomType,
                  body.largeBoxSizeCount,
                  body.mediumBoxSizeCount,
                  body.smallBoxSizeCount,
                  body.storageWeeks,
                  body.residenceName,
                  body.roomNumber,
                  body.phoneNumber,
                  body.addressType,
                  body.accessNote,
                  body.locationName,
                  body.localPhoneNum,
                  body.whatsPhoneNum,
                  body.contactTimes,
                  body.momoFullName,
                  body.momoPhoneNum,
                  body.cost,
                );
              },
              text: 'Book Now',
            ),
          ],
        ),
      ),
    );
  }
}
