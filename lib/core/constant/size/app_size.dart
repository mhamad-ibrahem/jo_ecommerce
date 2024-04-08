import 'package:flutter/material.dart';

class AppSize {
 static double screenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

 static double screenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }
  static const double appCustomRadius = 16;
}
