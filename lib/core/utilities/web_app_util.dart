import 'package:fit_fast_core/fit_fast_core.dart';
import 'package:flutter/material.dart';

class WebAppUtil {
  static ThemeData themeData = ThemeData(
    fontFamily: "Objective",
    primaryColor: ColorUtil.accentColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: ColorUtil.lightOrangeColor,
    ),
    scaffoldBackgroundColor: ColorUtil.whiteScaffold,
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}
