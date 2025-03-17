import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class AppTextField extends StatelessWidget {
  final String? labelText;
  final String hintText;
  final TextStyle? hintStyle;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final int maxLines;
  final int? maxLength;
  final bool showBorder;
  final Widget suffixIcon;
  final void Function(String)? onChanged;
  final String label;
  final String errorText;
  final bool enabled;
  final TextAlign textAlign;
  final List<TextInputFormatter> inputFormatters;
  final Color fillColor;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final Widget? prefixIcon;
  final Color prefixIconColor;
  final int line;
  final Widget prefixWidget;
  final bool readOnly;
  final bool isRequired;
  final double radius;
  final Color labelColor;
  final bool obscureText;
  final void Function() onTap;
  final Color cursorColor;
  final Color enabledColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final Function(String)? onFieldSubmitted;

  const AppTextField({
    super.key,
    this.label = '',
    required this.controller,
    required this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.readOnly = false,
    this.suffixIcon = const SizedBox.shrink(),
    this.onTap = _defaultOnTap,
    this.labelColor = kcTextColor,
    this.labelText,
    this.hintText = '',
    this.hintStyle,
    this.isPassword = false,
    this.maxLines = 1,
    this.maxLength,
    this.showBorder = true,
    this.onChanged,
    this.errorText = '',
    this.enabled = true,
    this.textAlign = TextAlign.start,
    this.inputFormatters = const [],
    this.fillColor = Colors.white,
    this.borderColor = Colors.transparent,
    this.padding = const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
    this.prefixIcon,
    this.prefixIconColor = Colors.grey,
    this.line = 1,
    this.prefixWidget = const SizedBox.shrink(),
    this.isRequired = false,
    this.radius = 10,
    this.cursorColor = Colors.black,
    this.enabledColor = const Color(0xffDFDFDF),
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  static void _defaultOnTap() {}

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodySmall!.copyWith(
            color: labelColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(4.h),
        TextFormField(
            controller: controller,
            validator: validator,
            keyboardType: keyboardType,
            obscureText: obscureText,
            readOnly: readOnly,
            onTap: onTap,
            maxLength: maxLength,
            maxLines: maxLines,
            cursorColor: cursorColor,
            focusNode: focusNode,
            textInputAction: textInputAction,
            onFieldSubmitted: onFieldSubmitted,
            style: context.bodyMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: hintStyle ??
                  context.bodyMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
              errorText: errorText == '' ? null : errorText,
              prefixIcon: prefixIcon != null
                  ? IconTheme(
                      data: IconThemeData(
                        color: Theme.of(context).iconTheme.color,
                      ),
                      child: prefixIcon ?? const SizedBox(),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: enabledColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
              // isDense: true,
              suffixIcon: suffixIcon != null
                  ? IconTheme(
                      data: IconThemeData(
                        color: Theme.of(context).iconTheme.color,
                      ),
                      child: suffixIcon,
                    )
                  : null,
              fillColor: fillColor,
              filled: true,
            )),
      ],
    );
  }
}
