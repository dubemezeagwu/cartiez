import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static EdgeInsets? padding;
  static Orientation? orientation;
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height;
    orientation = _mediaQueryData!.orientation;
    padding = _mediaQueryData!.padding;
  }
}
// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  EdgeInsets padding = SizeConfig.padding!;
  double safeArea = padding.top + padding.bottom;
  // figma height 812
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
// figma width 375
  return (inputWidth / 375.0) * screenWidth;
}
// Get height as per screen size  in percentage
double getPercentageScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight!;
  return (inputHeight / 100) * screenHeight;
}
// Get width as per screen size  in percentage
double getPercentageScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth!;
  return (inputWidth / 100) * screenWidth;
}