import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120.w,
        height: 96.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          image: DecorationImage(
            image: AssetImage(imageUrl),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            // Overlay with opacity
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: Colors.black.withValues(alpha: .4),
              ),
            ),
            // Text in the middle
            Center(
              child: Text(
                name,
                style: context.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
