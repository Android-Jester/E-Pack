import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page1/screen1.dart';
import 'package:e_pack/features/requestBuilder/presentation/pages/page1/screen2.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/build_bots.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/custom_button.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/radio_button.dart';
import 'package:flutter/material.dart';

import 'page1/screen3.dart';
import 'page1/screen4.dart';
import 'page_2.dart';

class Page1 extends StatefulWidget {
  static String id = "Page1";
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  int count = 0;
  PageController? _controller = PageController();
  TextEditingController? largeBoxController = TextEditingController(text: "0");
  TextEditingController? mediumBoxController = TextEditingController(text: "0");
  TextEditingController? smallBoxController = TextEditingController(text: "0");
  Config config = Config();
  int selectedRadio = 0;
  String semesterPeriod = "First Semester";
  int currentPage = 0;

  buttonRow() {
    return (currentPage == 4)
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
    config.init(context);
    List<Widget> pages = [
      Screen1(controller: _controller),
      const Screen2(),
      Screen3(
        largeBoxController: largeBoxController,
        smallBoxController: smallBoxController,
        mediumBoxController: mediumBoxController,
      ),
      Screen4()
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150.0,
                width: Config.width,
                decoration: const BoxDecoration(
                  color: Colors.grey,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(5.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(40.0))))),
                        onPressed: () => Navigator.pop(context),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                                  vertical: config.itemHeight(5.0),
                                  horizontal: config.itemWidth(10.0))
                              .copyWith(left: 20.0),
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    BuildDotsRow(
                        currentPage: currentPage,
                        index: currentPage,
                        length: pages.length),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color:
                      MaterialStateColor.resolveWith((states) => Colors.white),
                ),
              ),
              Container(
                height: Config.height! / 1.5,
                width: Config.width,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      currentPage = value;
                    });
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _controller,
                  itemCount: pages.length,
                  itemBuilder: (context, indexed) => pages[indexed],
                ),
              ),
              buttonRow(),
              if (currentPage == 4)
                CustomButton(
                  onPressed: () => Navigator.pushNamed(context, Page3.id),
                  text: 'Book Now',
                )
            ],
          ),
        ),
      ),
    );
  }
}
