import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class SheetWidget extends StatelessWidget {
  const SheetWidget({
    super.key,
    required this.children,
    required this.icon,
    this.height = 370,
  });
  final List<Widget> children;
  final Widget icon;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              top: 70.h,
              left: 32.w,
              right: 32.w,
              bottom: 10.h,
            ),
            child: Column(
              children: children,
            ),
          ),
        ),
        Positioned(
          top: -60,
          left: 0,
          right: 0,
          child: Center(
            child: Container(
              height: 100.h,
              width: 100.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: icon,
            ),
          ),
        ),
      ],
    );
  }
}
