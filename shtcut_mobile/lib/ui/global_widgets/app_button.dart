import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/loader.dart';
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
    this.isLoading = false,
    this.isDisabled = false,
    this.loadingColor,
  }) : assert(
          text != null || centerWidget != null,
          'Either text or centerWidget must be provided',
        );
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
  final bool isLoading;
  final bool isDisabled;
  final Color? loadingColor;
  @override
  Widget build(BuildContext context) {
    final isInteractionDisabled = isDisabled || isLoading;
    // Use the provided color or default to kcPrimaryColor
    // If color is explicitly set to Colors.transparent, respect that
    final buttonColor = color ?? kcPrimaryColor;

    // For disabled state, use grey or a faded version of the button color
    final displayColor = isDisabled ? Colors.grey : buttonColor;

    return GestureDetector(
      onTap: isInteractionDisabled ? null : callback,
      child: Container(
        height: height?.h ?? 50.h,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        decoration: BoxDecoration(
          color: displayColor,
          border: border,
          borderRadius: BorderRadius.circular(radius ?? 4.r),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? BouncingDotsLoader(
                color: loadingColor ?? Colors.white,
              )
            : centerWidget ??
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
