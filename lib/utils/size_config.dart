import 'package:flutter/material.dart';

class SizeConfig {
  final BuildContext context;

  SizeConfig(this.context);

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  /// Function to get device specific screen width
  double getHorizontalSize(double pixels) {
    return pixels * (screenWidth / 375);
  }

  /// Function to get device specific screen height
  double getVerticalSize(double pixels) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double screenHeightWithoutStatusBar = screenHeight - statusBarHeight;
    return pixels * (screenHeightWithoutStatusBar / 812);
  }

  /// Function to get device specific font size
  double getFontSize(double pixels) {
    double height = getVerticalSize(pixels);
    double width = getHorizontalSize(pixels);
    return height < width ? height : width;
  }

  /// Function to get the smallest size
  double getSmallestSize(double pixels) {
    double height = getVerticalSize(pixels);
    double width = getHorizontalSize(pixels);
    return height < width ? height : width;
  }
}
