import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class AppTextField extends StatefulWidget {
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
  final bool isDatePicker; // New parameter for date picker

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
    this.isDatePicker = false, // Default to false
  });

  static void _defaultOnTap() {}

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  String? _errorText;
  bool _hasInteracted = false;

  @override
  void initState() {
    super.initState();

    // Add listener to validate on change
    widget.controller.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    if (_hasInteracted) {
      _validate(widget.controller.text);
    }
  }

  void _validate(String value) {
    setState(() {
      _errorText = widget.validator(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: context.bodySmall!.copyWith(
            color: widget.labelColor,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(4.h),
        TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            keyboardType: widget.keyboardType,
            obscureText: widget.obscureText,
            readOnly: widget.readOnly ||
                widget.isDatePicker, // Make read-only if it's a date picker
            enabled: widget.enabled,
            onTap: widget.onTap,
            maxLength: widget.maxLength,
            maxLines: widget.maxLines,
            cursorColor: widget.cursorColor,
            focusNode: widget.focusNode,
            textInputAction: widget.textInputAction,
            onFieldSubmitted: widget.onFieldSubmitted,
            onChanged: (value) {
              if (!_hasInteracted) {
                setState(() {
                  _hasInteracted = true;
                });
              }
              _validate(value);
              if (widget.onChanged != null) {
                widget.onChanged!(value);
              }
            },
            // Also mark as interacted when the field loses focus
            onEditingComplete: () {
              if (!_hasInteracted) {
                setState(() {
                  _hasInteracted = true;
                });
                _validate(widget.controller.text);
              }
            },
            style: context.bodyMedium!.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: widget.hintStyle ??
                  context.bodyMedium!.copyWith(
                    color: Colors.grey,
                    fontWeight: FontWeight.w400,
                  ),
              errorText: _hasInteracted ? _errorText : null,
              prefixIcon: widget.prefixIcon != null
                  ? IconTheme(
                      data: IconThemeData(
                        color: Theme.of(context).iconTheme.color,
                      ),
                      child: widget.prefixIcon ?? const SizedBox(),
                    )
                  : null,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: widget.enabledColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(widget.radius),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                vertical: 12.h,
                horizontal: 16.w,
              ),
              // isDense: true,
              suffixIcon: widget.suffixIcon != null
                  ? IconTheme(
                      data: IconThemeData(
                        color: Theme.of(context).iconTheme.color,
                      ),
                      child: widget.suffixIcon,
                    )
                  : widget.isDatePicker
                      ? Icon(
                          Icons.calendar_today,
                          color: Colors.grey,
                          size: 20.w,
                        )
                      : null,
              fillColor: widget.fillColor,
              filled: true,
            )),
      ],
    );
  }
}
