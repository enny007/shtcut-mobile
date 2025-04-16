import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

// Define the label colors
class LabelColors {
  static const Color redLabel = Color(0xFFD58080);
  static const Color yellowLabel = Color(0xFFFFDD55);
  static const Color purpleLabel = Color(0xFFC837AB);
  static const Color greenLabel = Color(0xFF06B217);
  static const Color lavenderLabel = Color(0xFF8789F3);
  static const Color blueLabel = Color(0xFF454CEE);
  static const Color blackLabel = Color(0xFF141414);

  static List<Color> allColors = [
    redLabel,
    yellowLabel,
    purpleLabel,
    greenLabel,
    lavenderLabel,
    blueLabel,
    blackLabel,
  ];

  // Get a color by index (cycles through the list)
  static Color getColorByIndex(int index) {
    return allColors[index % allColors.length];
  }
}

class LabelTile extends StatelessWidget {
  final String title;
  final Color labelColor;
  final bool isSelected;
  final Function(bool?) onChanged;

  const LabelTile({
    super.key,
    required this.title,
    required this.labelColor,
    required this.isSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    // Replace ListTile with a custom layout to eliminate all extra spacing
    return Padding(
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          // Checkbox
          SizedBox(
            height: 16.h,
            width: 16.w,
            child: Checkbox(
              value: isSelected,
              onChanged: onChanged,
              activeColor: kcPrimaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
            ),
          ),
          SizedBox(width: 12.w), // Space between checkbox and label
          // Label container
          Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 6.h,
            ),
            decoration: BoxDecoration(
              color: labelColor.withValues(alpha: .2),
              borderRadius: BorderRadius.circular(4.r),
              border: Border.all(
                color: labelColor,
                width: 1,
              ),
            ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: labelColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
