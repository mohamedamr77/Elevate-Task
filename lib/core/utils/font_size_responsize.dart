import 'package:flutter/material.dart';

double getResponsiveFontSize(
    {required BuildContext context, required double fontSize}) {
  double scaleFactor = getScaleFactor(context: context);
  double fontResponsiveSize = fontSize * scaleFactor;

  // Clamp font size within limits (80% to 120% of calculated size)
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  // debugPrint("font size $fontResponsiveSize = $lowerLimit $upperLimit}");
  return fontResponsiveSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor({required BuildContext context}) {
  // var dispatcher =PlatformDispatcher.instance;
  // var physicalWidth =dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio =dispatcher.views.first.devicePixelRatio;
  //
  //   double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;

  if (width <= 400) {
    return width / 390; // Tighter scaling for small phones
  } else if (width <= 600) {
    return width / 500;
  } else if (width <= 900) {
    return width / 1000;
  } else {
    return width / 1920; // Slightly larger screens have larger base
  }
}
