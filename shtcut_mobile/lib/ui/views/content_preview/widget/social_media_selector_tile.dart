import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class SocialMediaSelector extends StatefulWidget {
  final Function(List<String>) onSelectionChanged;
  final List<String> initialSelection;

  const SocialMediaSelector({
    Key? key,
    required this.onSelectionChanged,
    this.initialSelection = const [],
  }) : super(key: key);

  @override
  State<SocialMediaSelector> createState() => _SocialMediaSelectorState();
}

class _SocialMediaSelectorState extends State<SocialMediaSelector> {
  late List<String> _selectedSocialTypes;

  @override
  void initState() {
    super.initState();
    _selectedSocialTypes = List.from(widget.initialSelection);
  }

  void _toggleSelection(String socialType) {
    setState(() {
      if (_selectedSocialTypes.contains(socialType)) {
        _selectedSocialTypes.remove(socialType);
      } else {
        _selectedSocialTypes.add(socialType);
      }
    });
    widget.onSelectionChanged(_selectedSocialTypes);
  }

  @override
  Widget build(BuildContext context) {
    // List of social media platforms with their SVG paths and display names
    final List<Map<String, String>> socialPlatforms = [
      {
        'id': 'facebook',
        'svgPath': 'assets/svgs/facebook_logo.svg',
        'title': 'Facebook',
      },
      {
        'id': 'instagram',
        'svgPath': 'assets/svgs/instagram_logo.svg',
        'title': 'Instagram',
      },
      {
        'id': 'tiktok',
        'svgPath': 'assets/svgs/tiktok_logo.svg',
        'title': 'TikTok',
      },
      {
        'id': 'twitter',
        'svgPath': 'assets/svgs/x_logo.svg',
        'title': 'Twitter',
      },
      {
        'id': 'linkedin',
        'svgPath': 'assets/svgs/linkedin_logo.svg',
        'title': 'LinkedIn',
      },
    ];

    return Container(
      width: double.infinity,
      height: 40.h,
      padding: EdgeInsets.symmetric(
        vertical: 2.h,
        horizontal: 8.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all(
          color: const Color(0xFFCCCBCB),
          width: 1.w,
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: socialPlatforms.map((platform) {
            final isSelected = _selectedSocialTypes.contains(platform['id']);
            return GestureDetector(
              onTap: () => _toggleSelection(platform['id']!),
              child: Container(
                margin: EdgeInsets.only(right: 8.w),
                width: 70.w,
                height: 26.h,
                decoration: BoxDecoration(
                  color: isSelected ? kcPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(4.r),
                ),
                alignment: Alignment.center,
                child: Text(
                  platform['title']!,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
