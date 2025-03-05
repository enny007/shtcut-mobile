import 'package:flutter/material.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class AdaptableIcon extends StatelessWidget {
  final List<Widget> icons;
  final bool showBorder;
  final double borderWidth;
  final Color borderColor;
  final double size;
  final int maxVisibleIcons;

  const AdaptableIcon({
    Key? key,
    required this.icons,
    this.showBorder = false,
    this.borderWidth = 1.0,
    this.borderColor = kcPrimaryColor,
    this.size = 24,
    this.maxVisibleIcons = 3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Handle empty list case
    if (icons.isEmpty) {
      return SizedBox(width: size, height: size);
    }

    // Single icon case
    if (icons.length == 1) {
      return Container(
        width: size,
        height: size,
        decoration: showBorder
            ? BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: borderColor,
                  width: borderWidth,
                ),
              )
            : null,
        child: Center(child: icons.first),
      );
    }

    // Multiple icons case
    final visibleIcons = icons.length > maxVisibleIcons
        ? icons.take(maxVisibleIcons).toList()
        : icons;
    final remainingCount = icons.length - visibleIcons.length;
    final offset = size * 0.85; // Adjust this value for edge attachment

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: offset * (visibleIcons.length - 1) + size,
          height: size,
          child: Stack(
            children: [
              // Position visible icons with edge attachment
              SizedBox(
                width: offset * (visibleIcons.length - 1) + size,
                height: size,
                child: Stack(
                  children: [
                    for (int i = 0; i < visibleIcons.length; i++)
                      Positioned(
                        left: i * offset,
                        child: Container(
                          width: size,
                          height: size,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            border: showBorder
                                ? Border.all(
                                    color: borderColor,
                                    width: borderWidth,
                                  )
                                : null,
                          ),
                          child: Center(child: visibleIcons[i]),
                        ),
                      ),
                  ],
                ),
              ),

              // Show remaining count if needed
            ],
          ),
        ),
        if (remainingCount > 0)
          Padding(
            padding: const EdgeInsets.only(left: 4),
            child: Text(
              '+$remainingCount',
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }
}
