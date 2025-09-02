import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SizeConfig {
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;

  static double textMultiplier = 0;
  static double imageSizeMultiplier = 0;
  static double heightMultiplier = 0;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    textMultiplier = blockSizeVertical;
    imageSizeMultiplier = blockSizeHorizontal;
    heightMultiplier = blockSizeVertical;
  }
}

double getProportionateScreenHeight(double inputHeight) {
  return inputHeight.h;
}

double getProportionateScreenWidth(double inputWidth) {
  return inputWidth.w;
}

double getProportionateFontSize(double inputFontSize) {
  return inputFontSize.sp;
}
