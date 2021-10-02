import 'package:flutter/widgets.dart';

class Config {
  static MediaQueryData? _mediaQueryData;
  static double? width;
  static double? height;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    orientation = _mediaQueryData!.orientation;
    width = _mediaQueryData!.size.width;
    height = _mediaQueryData!.size.height;
  }

  double itemWidth(double input) => (input / 411.0) * width!;
  double itemHeight(double input) => (input / 411.0) * height!;
}

// const kPrimaryColor
// const kPrimaryDarkColor
// const kAccentColor
// const kAccentDarkColor
// const kBackgroundColor
