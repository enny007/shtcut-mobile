import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class FacebookPreviewCard extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String postText;
  final List<String>? postImages;

  const FacebookPreviewCard({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.postText,
    this.postImages,
  }) : super(key: key);

  @override
  State<FacebookPreviewCard> createState() => _FacebookPreviewCardState();
}

class _FacebookPreviewCardState extends State<FacebookPreviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7.r),
        border: Border.all(
          color: const Color(0xFFE9EAEB),
          width: 0.87.w,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // // Preview label
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.symmetric(vertical: 8.h),
          //   decoration: const BoxDecoration(
          //     color: Color(0xFFE7F3FF),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(7),
          //       topRight: Radius.circular(7),
          //     ),
          //   ),
          //   child: Center(
          //     child: Text(
          //       'FACEBOOK PREVIEW',
          //       style: TextStyle(
          //         color: const Color(0xFF1877F2),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 12.sp,
          //       ),
          //     ),
          //   ),
          // ),

          // Header with profile picture and name
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                Gap(10.w),

                // Username and post time
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: context.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Row(
                        children: [
                          //   Text(
                          //     'Just now',
                          //       style: context.bodySmall!.copyWith(
                          //   fontWeight: FontWeight.w600,
                          //   color: kcPrimaryColor,
                          // ),
                          //   ),
                          // Gap(4.w),
                          // Icon(
                          //   Icons.public,
                          //   size: 12.r,
                          //   color: Colors.grey[600],
                          // ),
                        ],
                      ),
                    ],
                  ),
                ),

                // More options
                Icon(
                  Icons.more_horiz,
                  color: Colors.grey[700],
                  size: 20.r,
                ),
              ],
            ),
          ),

          // Post text
          if (widget.postText.isNotEmpty)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.r),
              child: Text(
                widget.postText,
                style: TextStyle(
                  fontSize: 15.sp,
                  height: 1.3,
                ),
              ),
            ),

          Gap(8.h),

          // Post images
          if (widget.postImages != null && widget.postImages!.isNotEmpty)
            _buildPostImages(),

          // Adding some bottom padding for better spacing
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  Widget _buildPostImages() {
    final images = widget.postImages!;

    // For a single image
    if (images.length == 1) {
      return Container(
        width: double.infinity,
        constraints: BoxConstraints(
          maxHeight: 300.h,
        ),
        child: Image.network(
          images[0],
          fit: BoxFit.cover,
        ),
      );
    }

    // For two images
    else if (images.length == 2) {
      return SizedBox(
        height: 200.h,
        child: Row(
          children: [
            Expanded(
              child: Image.network(
                images[0],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Image.network(
                images[1],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
          ],
        ),
      );
    }

    // For three images
    else if (images.length == 3) {
      return SizedBox(
        height: 200.h,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                images[0],
                fit: BoxFit.cover,
                height: double.infinity,
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      images[1],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Expanded(
                    child: Image.network(
                      images[2],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // For four or more images
    else {
      return SizedBox(
        height: 200.h,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(
                      images[0],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Image.network(
                      images[1],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 2),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Image.network(
                      images[2],
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  const SizedBox(width: 2),
                  Expanded(
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          images[3],
                          fit: BoxFit.cover,
                        ),
                        if (images.length > 4)
                          Container(
                            color: Colors.black.withValues(alpha: .5),
                            child: Center(
                              child: Text(
                                '+${images.length - 4}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}
