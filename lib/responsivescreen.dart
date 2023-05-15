import 'package:flutter/material.dart';

class ResponsiveScreen {
  static double? ScreenHeight;
  static double? ScreenWidth;

  static double fullRepHeight(BuildContext context, double _height) {
    return MediaQuery.of(context).size.height * (_height / ScreenHeight!);
  }

  static double halfRepHeight(BuildContext context, double _height) {
    return MediaQuery.of(context).size.height > ScreenHeight!
        ? _height
        : MediaQuery.of(context).size.height * (_height / ScreenHeight!);
  }

  static double fullRepWidth(BuildContext context, double _width) {
    return MediaQuery.of(context).size.height * (_width / ScreenWidth!);
  }

  static double halfRepWidth(BuildContext context, double _width) {
    return MediaQuery.of(context).size.width > ScreenWidth!
        ? _width
        : MediaQuery.of(context).size.height * (_width / ScreenWidth!);
  }
}
