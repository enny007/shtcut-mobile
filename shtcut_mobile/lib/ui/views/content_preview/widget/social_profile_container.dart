import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class SocialProfilesContainer extends StatelessWidget {
  const SocialProfilesContainer({
    Key? key,
    required this.selectedPlatforms,
    required this.onPlatformSelected,
  }) : super(key: key);

  final List<String> selectedPlatforms;
  final Function(String) onPlatformSelected;
  @override
  Widget build(BuildContext context) {
    // List of social media platforms with their SVG paths
    final List<Map<String, String>> socialPlatforms = [
      {
        'id': 'facebook',
        'svgPath': 'assets/svgs/facebook_logo.svg',
      },
      {
        'id': 'instagram',
        'svgPath': 'assets/svgs/instagram_logo.svg',
      },
      {
        'id': 'tiktok',
        'svgPath': 'assets/svgs/tiktok_logo.svg',
      },
      {
        'id': 'twitter',
        'svgPath': 'assets/svgs/x_logo.svg',
      },
      {
        'id': 'linkedin',
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
              GestureDetector(
                onTap: () {
                  // Safely access the id, providing a fallback if null
                  final platformId = socialPlatforms[index]['id'] ?? '';
                  if (platformId.isNotEmpty) {
                    onPlatformSelected(platformId);
                  }
                },
                child: SocialProfileItem(
                  svgPath: socialPlatforms[index]['svgPath'] ?? '',
                  isSelected:
                      selectedPlatforms.contains(socialPlatforms[index]['id']),
                ),
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
  final bool isSelected;

  const SocialProfileItem({
    Key? key,
    required this.svgPath,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Profile picture circle with selection indicator
        Container(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: isSelected
                ? Border.all(
                    color: kcPrimaryColor,
                    width: 2.w,
                  )
                : null,
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
