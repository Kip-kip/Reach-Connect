import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth =0;
  static double screenHeight =0;
  static double defaultSize =0;
  static Orientation orientation = Orientation.portrait;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
  }
}



// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = Get.height;
  // Our designer use iPhone 11, that's why we use 896.0
  return (inputHeight / 896.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth =Get.width;
  // 414 is the layout width that designer use or you can say iPhone 11  width
  return (inputWidth / 414.0) * screenWidth;
}

// For add free space vertically
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({
     Key? key,
    this.of = 20,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(of),
    );
  }
}

// For add free space horizontally
class HorizontalSpacing extends StatelessWidget {
  const HorizontalSpacing({
    required Key? key,
    this.of = 20,
  }) : super(key: key);

  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: getProportionateScreenWidth(of),
    );
  }
}
