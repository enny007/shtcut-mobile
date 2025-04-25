import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class CustomDropdown extends StatelessWidget {
  final String hintText;
  final String? value;
  final String label;
  final bool isOpen;
  final VoidCallback onToggle;
  final Widget prefixIcon;
  final List<String> items;
  final Function(String) onItemSelected;

  const CustomDropdown({
    Key? key,
    required this.hintText,
    this.value,
    required this.isOpen,
    required this.onToggle,
    required this.prefixIcon,
    required this.items,
    required this.onItemSelected,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Dropdown header
        Text(
          label,
          style: context.bodySmall!.copyWith(
            fontWeight: FontWeight.w500,
            color: const Color(0xff433E3F),
          ),
        ),
        Gap(4.h),
        GestureDetector(
          onTap: onToggle,
          child: Container(
            height: 44.h,
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(
                color: const Color(0xff98A2B3),
                width: 1,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff101828).withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Row(
              children: [
                prefixIcon,
                Gap(8.w),
                Expanded(
                  child: Text(
                    value ?? hintText,
                    style: context.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: value == null
                          ? const Color(0xff98A2B3)
                          : const Color(0xff344054),
                    ),
                  ),
                ),
                Icon(
                  isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                  color: kcPrimaryColor,
                  size: 24,
                ),
              ],
            ),
          ),
        ),

        // Dropdown items
        if (isOpen)
          Container(
            margin: EdgeInsets.only(top: 4.h),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.r),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xff101828).withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                final isSelected = value == item;

                return GestureDetector(
                  onTap: () => onItemSelected(item),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12.w,
                      vertical: 10.h,
                    ),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? kcPrimaryColor.withOpacity(0.1)
                          : Colors.white,
                      border: Border(
                        bottom: index < items.length - 1
                            ? const BorderSide(
                                color: Color(0xffF2F4F7),
                                width: 1,
                              )
                            : BorderSide.none,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            item,
                            style: context.bodyMedium!.copyWith(
                              color: isSelected
                                  ? kcPrimaryColor
                                  : const Color(0xff344054),
                              fontWeight: isSelected
                                  ? FontWeight.w500
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                        if (isSelected)
                          Icon(
                            Icons.check,
                            color: kcPrimaryColor,
                            size: 18.sp,
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
      ],
    );
  }
}
