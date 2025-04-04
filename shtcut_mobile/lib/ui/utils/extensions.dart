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

  bool get isTablet => MediaQuery.of(this).size.shortestSide >= 600;

  TextStyle? get displayLarge => _getAdaptiveTextStyle(textTheme.displayLarge);
  TextStyle? get displayMedium =>
      _getAdaptiveTextStyle(textTheme.displayMedium);
  TextStyle? get displaySmall => _getAdaptiveTextStyle(textTheme.displaySmall);

  TextStyle? get bodyLarge => _getAdaptiveTextStyle(textTheme.bodyLarge);
  TextStyle? get bodyMedium => _getAdaptiveTextStyle(textTheme.bodyMedium);
  TextStyle? get bodySmall => _getAdaptiveTextStyle(textTheme.bodySmall);

  TextStyle? _getAdaptiveTextStyle(TextStyle? style) {
    if (style == null) return null;

    // Scale factor for tablets (adjust as needed)
    final scaleFactor = isTablet ? 1.3 : 1.0;

    return style.copyWith(
      fontSize: style.fontSize != null ? style.fontSize! * scaleFactor : null,
    );
  }
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
