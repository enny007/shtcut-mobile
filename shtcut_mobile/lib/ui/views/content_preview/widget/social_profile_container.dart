import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SocialProfilesContainer extends StatelessWidget {
  const SocialProfilesContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of social media platforms with their SVG paths
    final List<Map<String, String>> socialPlatforms = [
      {
        'svgPath': 'assets/svgs/facebook_logo.svg',
      },
      {
        'svgPath':
            'assets/svgs/instagram_logo.svg', // Assuming you have this SVG
      },
      {
        'svgPath': 'assets/svgs/tiktok_logo.svg',
      },
      {
        'svgPath': 'assets/svgs/x_logo.svg',
      },
      {
        'svgPath': 'assets/svgs/linkedin_logo.svg',
      },
    ];

    return Container(
      width: double.infinity,
      height: 48.h,
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
        horizontal: 13.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(
          color: const Color(0xFFCCCBCB),
          width: 1.w,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(
          socialPlatforms.length,
          (index) => Row(
            children: [
              SocialProfileItem(
                svgPath: socialPlatforms[index]['svgPath']!,
              ),
              // Add gap between items, except after the last item
              if (index < socialPlatforms.length - 1) Gap(34.w),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialProfileItem extends StatelessWidget {
  final String svgPath;

  const SocialProfileItem({
    Key? key,
    required this.svgPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Profile picture circle
        Container(
          width: 32.w,
          height: 32.h,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: Center(
            child: Image.asset(
              'assets/images/x_dummy.png',
              width: 24.w,
              height: 24.h,
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Social type indicator at the end edge
        Positioned(
          right: 0,
          bottom: 0,
          child: Container(
            width: 12.w,
            height: 12.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.white,
                width: 1.w,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: SvgPicture.asset(
                svgPath,
                width: 8.w,
                height: 8.h,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
