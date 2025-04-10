import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/home/widgets/adaptable_icon.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String scheduledTime;
  final List<Widget> socialIcons;
  final String? imageUrl;
  final int? additionalImagesCount;
  final VoidCallback onEdit;
  final VoidCallback onPublish;

  const PostCard({
    Key? key,
    required this.title,
    required this.scheduledTime,
    required this.socialIcons,
    this.imageUrl,
    this.additionalImagesCount,
    required this.onEdit,
    required this.onPublish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xffFEFEFE),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left side with blue bar and content
          Expanded(
            flex: 3,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Blue vertical bar
                Container(
                  width: 6.w,
                  height: 175.h,
                  decoration: BoxDecoration(
                    color: kcPrimaryColor,
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                ),

                // Content
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Social media icons
                        AdaptableIcon(
                          icons: socialIcons.take(3).toList(),
                          size: 28.w,
                          showBorder: true,
                          borderColor: kcPrimaryColor,
                          maxVisibleIcons: 3,
                        ),

                        Gap(16.h),

                        // Title
                        Text(
                          title,
                          style: context.bodySmall!.copyWith(
                            color: Colors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        Gap(10.h),

                        // Scheduled time
                        Text(
                          'Scheduled: $scheduledTime',
                          style: context.bodySmall!.copyWith(
                            color: const Color(0xff5A5555),
                          ),
                        ),

                        Gap(16.h),

                        // Action buttons
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: onPublish,
                                child: Container(
                                  width: 74.w,
                                  height: 26.h,
                                  decoration: BoxDecoration(
                                    color: kcPrimaryColor,
                                    borderRadius: BorderRadius.circular(4.r),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Publish',
                                    style: context.bodySmall!.copyWith(
                                      color: Colors.white,
                                      // fontSize: 7.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Gap(8.w),
                            Expanded(
                              child: GestureDetector(
                                onTap: onEdit,
                                child: Container(
                                  width: 74.w,
                                  height: 26.h,
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                      color: kcPrimaryColor,
                                      width: 1,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Edit',
                                    style: context.bodySmall!.copyWith(
                                      color: kcPrimaryColor,
                                      // fontSize: 7.sp,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            // Expanded(
                            //   child: AppButton(
                            //     callback: onEdit,
                            //     text: 'Edit',
                            //     textColor: kcPrimaryColor,
                            //     color: Colors.white,
                            //     border: Border.all(
                            //       width: 1,
                            //       color: kcPrimaryColor,
                            //     ),
                            //     height: 30.h,
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Right side with optional image
          if (imageUrl != null)
            Expanded(
              flex: 2,
              child: Container(
                height: 167.h,
                margin: EdgeInsets.only(
                  top: 5.h,
                  right: 5.w,
                  bottom: 5.h,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: AssetImage(imageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                child:
                    additionalImagesCount != null && additionalImagesCount! > 0
                        ? Stack(
                            children: [
                              // Semi-transparent overlay
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: Colors.black.withValues(alpha: .3),
                                ),
                              ),

                              // +X indicator
                              Positioned(
                                right: 8.w,
                                bottom: 8.h,
                                child: Text(
                                  '+$additionalImagesCount',
                                  style: context.bodySmall!.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        : null,
              ),
            ),
        ],
      ),
    );
  }
}
