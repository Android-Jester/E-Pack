import 'package:e_pack/features/requestBuilder/presentation/config/config.dart';
import 'package:e_pack/features/requestBuilder/presentation/widgets/radio_button.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

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

  onChangedItem(Object? value) {
    setState(() => selectedRadio = int.parse(value.toString()));
  }

  Widget buildRowDots({required int index, required int length}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) => buildDot(index: index),
      ),
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
      duration: const Duration(seconds: 1),
      margin: const EdgeInsets.only(right: 5),
      height: 6.0,
      width: currentPage == index ? 20 : 6,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.blue : const Color(0xFFD8D8D8),
        borderRadius: BorderRadius.circular(3),
      ),
    );
  }

  List<bool> list = [true, false, true, true];

  @override
  Widget build(BuildContext context) {
    config.init(context);
    List<Widget> pages = [
      Container(
        width: Config.width,
        height: Config.height,
        child: Column(
          children: [
            const SizedBox(
              height: 5.0,
            ),
            const Text(
              "Pick A Slot",
              style: TextStyle(fontSize: 30.0),
            ),
            const SizedBox(
              height: 5.0,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                color: Colors.blue,
              )),
              width: Config.width! / 1.2,
              child: SfDateRangePicker(),
            ),
            SizedBox(height: config.itemHeight(15.0)),
            Container(
              child: DropdownButton(
                  value: semesterPeriod,
                  items: const [
                    DropdownMenuItem(
                      child: Text("First Semester"),
                      value: "First Semester",
                    ),
                    DropdownMenuItem(
                      child: Text("First Semester"),
                      value: "Second Semester",
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      semesterPeriod = value.toString();
                    });
                  }),

              // TextField(
              //   readOnly: true,
              //   decoration: InputDecoration(
              //       border: OutlineInputBorder(
              //     borderRadius: BorderRadius.circular(config.itemWidth(12.0)),
              //   )),
              // ),
            ),
            SizedBox(height: config.itemHeight(15.0)),
            //TODO: TimeStamp(Display the information on the number of days apart)
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    side: const BorderSide(
                      color: Colors.black,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                  ),
                ),
              ),
              child: const Text("Next"),
              onPressed: (currentPage <= 4)
                  ? () => {
                        _controller!.animateToPage(currentPage++,
                            duration: Duration(milliseconds: 100), curve: Curves.easeIn),
                      }
                  : null,
            ),
          ],
        ),
      ),
      Container(
        width: Config.width,
        height: Config.height,
        child: Column(
          children: [
            Text("Select One Option"),
            Text("Select Room Type"),
            Divider(),
            selectionRow(
                value: 1,
                text: "Single Room",
                onChanged: onChangedItem,
                selectedRadio: selectedRadio,
                config: config),
            selectionRow(
                value: 2,
                text: "Double Room",
                onChanged: onChangedItem,
                selectedRadio: selectedRadio,
                config: config),
            selectionRow(
                value: 3,
                text: "Two or more",
                onChanged: onChangedItem,
                selectedRadio: selectedRadio,
                config: config),
            selectionRow(
                value: 4,
                text: "Apartment",
                onChanged: onChangedItem,
                selectedRadio: selectedRadio,
                config: config),
            selectionRow(
                value: 5,
                text: "Homestel",
                onChanged: onChangedItem,
                selectedRadio: selectedRadio,
                config: config),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                      ),
                    ),
                  ),
                  child: const Text("Next"),
                  onPressed: (currentPage >= 1)
                      ? () => {
                            _controller!.animateToPage(currentPage--,
                                duration: Duration(milliseconds: 100), curve: Curves.easeIn),
                          }
                      : null,
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                      ),
                    ),
                  ),
                  child: const Text("Next"),
                  onPressed: (currentPage <= 4)
                      ? () => {
                            _controller!.animateToPage(currentPage++,
                                duration: Duration(milliseconds: 100), curve: Curves.easeIn),
                          }
                      : null,
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        width: Config.width,
        height: Config.height,
        child: Column(
          children: [
            const Divider(),
            const Text("Select"),
            const Text(
                "Please choose the particular type and number of boxes you may need for your belongings"),
            const Divider(),
            const Spacer(),
            boxSelection(textEditingController: largeBoxController, text: "Large Box"),
            boxSelection(textEditingController: mediumBoxController, text: "Medium Box"),
            boxSelection(textEditingController: smallBoxController, text: "Small Box"),
            const Spacer(),
            Container(
              color: Colors.red.shade200,
              width: Config.width,
              height: Config.width! / 3,
              child: const Text(
                  "NB:  Size of Large Box: 18”x18”x24” \n Size of Medium Box: 18”x18”x16” \n Size of Small Box: 16”x12”x12” "),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                      ),
                    ),
                  ),
                  child: const Text("Next"),
                  onPressed: (currentPage >= 1)
                      ? () => {
                            _controller!.animateToPage(currentPage--,
                                duration: Duration(milliseconds: 100), curve: Curves.easeIn),
                          }
                      : null,
                ),
                TextButton(
                  style: ButtonStyle(
                    foregroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.black,
                          width: 1.5,
                        ),
                        borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                      ),
                    ),
                  ),
                  child: const Text("Next"),
                  onPressed: (currentPage <= 4)
                      ? () => {
                            _controller!.animateToPage(currentPage++,
                                duration: Duration(milliseconds: 100), curve: Curves.easeIn),
                          }
                      : null,
                ),
              ],
            )
          ],
        ),
      ),
      Container(
        color: Colors.grey,
        width: 100,
        height: 100,
      ),
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
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: TextButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(40.0))))),
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
                    buildRowDots(index: currentPage, length: pages.length),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: MaterialStateColor.resolveWith((states) => Colors.white),
                ),
              ),
              Container(
                height: Config.height! / 1.4,
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
              TextButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateColor.resolveWith((states) => Colors.grey),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Colors.black,
                        width: 1.5,
                      ),
                      borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                    ),
                  ),
                ),
                child: const Text("Book Now"),
                onPressed: () => Navigator.pushNamed(context, Page2.id),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding boxSelection(
      {required String text, required TextEditingController? textEditingController}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: config.itemWidth(10.0))
          .copyWith(top: config.itemWidth(10.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                  color: Colors.red,
                ),
                child: IconButton(
                    onPressed: () {
                      setState(() {
                        if (count > 0) {
                          count -= 1;
                        }
                        textEditingController!.text = count.toString();
                      });
                    },
                    icon: const Icon(Icons.remove)),
              ),
              Container(
                  width: config.itemWidth(40.0),
                  height: config.itemHeight(20.0),
                  child: TextField(
                    textAlign: TextAlign.center,
                    readOnly: true,
                    controller: textEditingController,
                  )),
              Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(config.itemWidth(20.0)),
                    color: Colors.red,
                  ),
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          count += 1;
                          textEditingController!.text = count.toString();
                        });
                      },
                      icon: const Icon(Icons.add))),
            ],
          )
        ],
      ),
    );
  }
}
