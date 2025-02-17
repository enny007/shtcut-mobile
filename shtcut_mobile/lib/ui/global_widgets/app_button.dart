import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    this.text = '',
    this.color,
    this.radius,
    this.border,
    required this.callback,
    this.textColor,
    this.centerWidget,
    this.verticalPadding = 10,
    this.horizontalPadding = 00,
    this.fontSize,
    this.fontWeight,
    this.height,
  });
  final String text;
  final Color? color;
  final double? radius;
  final BoxBorder? border;
  final VoidCallback callback;
  final Color? textColor;
  final Widget? centerWidget;
  final double verticalPadding;
  final double horizontalPadding;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        height: height?.h ?? 42.h,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 4.r),
        ),
        alignment: Alignment.center,
        child: centerWidget ??
            Text(
              text,
              style: context.bodyMedium!.copyWith(
                color: textColor ?? Colors.white,
                fontWeight: fontWeight ?? FontWeight.w500,
                fontSize: fontSize ?? 16.sp,
              ),
            ),
      ),
    );
  }
}
