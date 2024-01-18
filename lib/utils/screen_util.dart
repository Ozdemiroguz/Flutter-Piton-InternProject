import 'package:flutter/widgets.dart';

class ScreenUtil {
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double getScreenHeightPercentage(
      BuildContext context, double percentage) {
    return getScreenHeight(context) * percentage;
  }

  static double getScreenWidthPercentage(
      BuildContext context, double percentage) {
    return getScreenWidth(context) * percentage;
  }
}
