import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class TabRack extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabChanged;

  const TabRack({
    Key? key,
    required this.currentIndex,
    required this.onTabChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabs = ['All Media', 'Images', 'Videos', 'Files', 'Folder'];

    return Container(
      height: 45.h,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: DefaultTabController(
        length: tabs.length,
        initialIndex: currentIndex,
        child: Column(
          children: [
            Expanded(
              child: TabBar(
                onTap: onTabChanged,
                indicatorColor: Colors.transparent,
                labelColor: kcPrimaryColor,
                unselectedLabelColor: Colors.grey[600],
                dividerColor: Colors.transparent,
                labelStyle: context.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                unselectedLabelStyle: context.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                ),
                tabs: tabs
                    .map((tab) => Tab(
                          text: tab,
                        ))
                    .toList(),
                tabAlignment: TabAlignment.fill,
                padding: EdgeInsets.zero,
                labelPadding: EdgeInsets.symmetric(horizontal: 4.w),
                indicator: _CustomIndicator(
                  color: kcPrimaryColor,
                  height: 2.h,
                  radius: 2.r,
                ),
              ),
            ),
            Container(
              height: 2.h,
              color: const Color(0xffD9D9D9),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomIndicator extends Decoration {
  final Color color;
  final double height;
  final double radius;

  const _CustomIndicator({
    required this.color,
    required this.height,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CustomIndicatorPainter(
      color: color,
      height: height,
      radius: radius,
    );
  }
}

class _CustomIndicatorPainter extends BoxPainter {
  final Color color;
  final double height;
  final double radius;

  _CustomIndicatorPainter({
    required this.color,
    required this.height,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    // Calculate width based on text width (with some padding)
    final double width = configuration.size!.width;

    // Center the indicator under the text
    final double left = offset.dx + (configuration.size!.width - width) / 2;
    final double top = offset.dy + configuration.size!.height - height;

    final Rect rect = Rect.fromLTWH(left, top, width, height);
    final RRect rRect = RRect.fromRectAndRadius(rect, Radius.circular(radius));

    canvas.drawRRect(rRect, paint);
  }
}
