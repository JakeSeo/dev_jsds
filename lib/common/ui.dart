import 'package:flutter/material.dart';

class UI {
  static final UI ui = UI._internal();
  double screenWidth = 0;
  double screenHeight = 0;
  double statusBarsSize = 0;
  double navigationBarSize = 0;
  double curScaleFactor = 0;

  factory UI() {
    return ui;
  }

  void setContext(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    statusBarsSize = MediaQuery.of(context).padding.top;
    navigationBarSize = MediaQuery.of(context).padding.bottom;
    curScaleFactor = MediaQuery.of(context).textScaleFactor;
  }

  UI._internal();

  double generateWidth(double width) {
    double resultWidth = screenWidth * width / 100;
    return resultWidth;
  }

  double generateHeight(double height) {
    double resultHeight = screenHeight * height / 100;
    return resultHeight;
  }

  double getStatusBarsize() {
    return statusBarsSize;
  }

  double getnavigationBarSize() {
    return navigationBarSize;
  }

  double getHalfWidth() {
    return (screenWidth / 2.0);
  }

  double getHalfHeight() {
    return ((screenHeight - statusBarsSize - navigationBarSize) / 2);
  }

  double getCurScaleFactor(double fontsize) {
    return fontsize / curScaleFactor;
  }

  static MaterialColor createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map<int, Color> swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    for (var strength in strengths) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(color.value, swatch);
  }
}
