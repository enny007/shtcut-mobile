import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension MediaQueryShortcut on BuildContext {
  double get width => MediaQuery.of(this).size.width.w;
  double get height => MediaQuery.of(this).size.height.h;
}

//Getters for styles
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;

  TextStyle? get displayLarge => textTheme.displayLarge;
  TextStyle? get displayMedium => textTheme.displayMedium;
  TextStyle? get displaySmall => textTheme.displaySmall;

  TextStyle? get bodyLarge => textTheme.bodyLarge;
  TextStyle? get bodyMedium => textTheme.bodyMedium;
  TextStyle? get bodySmall => textTheme.bodySmall;
}

extension EdgeInsetsExtension on EdgeInsets {
  static EdgeInsets fromPercentage({
    required double lefthorizontalPercentage,
    required double righthorizontalPercentage,
    required double topverticalPercentage,
    required double bottomverticalPercentage,
    Size referenceSize = const Size(375, 812),
    required BuildContext context,
  }) {
    return EdgeInsets.only(
      left: lefthorizontalPercentage /
          referenceSize.width *
          MediaQuery.sizeOf(context).width,
      right: righthorizontalPercentage /
          referenceSize.width *
          MediaQuery.sizeOf(context).width,
      top: topverticalPercentage /
          referenceSize.height *
          MediaQuery.sizeOf(context).height,
      bottom: bottomverticalPercentage /
          referenceSize.height *
          MediaQuery.sizeOf(context).height,
    );
  }
}
