import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class DottedBorderContainer extends StatelessWidget {
  final Widget child;

  const DottedBorderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 355.w,
      height: 176.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: CustomPaint(
        painter: DottedBorderPainter(
          color: kcPrimaryColor,
          strokeWidth: 1.5,
          gap: 5,
        ),
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: child,
          ),
        ),
      ),
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double gap;

  DottedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.gap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final Path path = Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height),
        const Radius.circular(8),
      ));

    final Path dashPath = Path();

    double distance = 0.0;
    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + gap),
          Offset.zero,
        );
        distance += gap * 2;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
