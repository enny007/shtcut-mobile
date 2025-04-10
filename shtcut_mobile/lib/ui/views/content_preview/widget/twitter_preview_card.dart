import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TwitterPreviewCard extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String handle;
  final String tweetText;
  final List<String>? tweetImages;

  const TwitterPreviewCard({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.handle,
    required this.tweetText,
    this.tweetImages,
  }) : super(key: key);

  @override
  State<TwitterPreviewCard> createState() => _TwitterPreviewCardState();
}

class _TwitterPreviewCardState extends State<TwitterPreviewCard> {
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
          // Preview label
          // Container(
          //   width: double.infinity,
          //   padding: EdgeInsets.symmetric(vertical: 8.h),
          //   decoration: const BoxDecoration(
          //     color: Color(0xFFE8F5FD),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(7),
          //       topRight: Radius.circular(7),
          //     ),
          //   ),
          //   child: Center(
          //     child: Text(
          //       'TWEET PREVIEW',
          //       style: TextStyle(
          //         color: const Color(0xFF1DA1F2),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 12.sp,
          //       ),
          //     ),
          //   ),
          // ),

          // Header with profile picture, name, handle
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                Gap(10.w),

                // Username and handle
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Username and handle
                      Row(
                        children: [
                          Text(
                            widget.username,
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 15.sp,
                            ),
                          ),
                          Gap(4.w),
                          Expanded(
                            child: Text(
                              '@${widget.handle}',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14.sp,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),

                      // Tweet text
                      Padding(
                        padding: EdgeInsets.only(top: 4.h),
                        child: Text(
                          widget.tweetText,
                          style: TextStyle(
                            fontSize: 15.sp,
                            height: 1.3,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Tweet images (if any)
          if (widget.tweetImages != null && widget.tweetImages!.isNotEmpty)
            _buildTweetImages(),

          // Adding some bottom padding for better spacing
          SizedBox(height: 12.h),
        ],
      ),
    );
  }

  Widget _buildTweetImages() {
    final images = widget.tweetImages!;

    // For a single image
    if (images.length == 1) {
      return Container(
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 12.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          image: DecorationImage(
            image: NetworkImage(images[0]),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // For two images - side by side
    else if (images.length == 2) {
      return Container(
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 12.r),
        child: Row(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 2.w),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(12.r),
                    bottomRight: Radius.circular(12.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(images[1]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    // For three images - one large, two small
    else if (images.length == 3) {
      return Container(
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 12.r),
        child: Row(
          children: [
            // Left image (larger)
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    bottomLeft: Radius.circular(12.r),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(images[0]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 2.w),
            // Right column with two images
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(images[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12.r),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(images[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // For four images - grid layout
    else if (images.length >= 4) {
      return Container(
        height: 200.h,
        margin: EdgeInsets.symmetric(horizontal: 12.r),
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.r),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(images[0]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12.r),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(images[1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 2.h),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.r),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(images[2]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 2.w),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(12.r),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(images[3]),
                          fit: BoxFit.cover,
                        ),
                        // If there are more than 4 images, show a count overlay
                      ),
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12.r),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(images[3]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          if (images.length > 4)
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.4),
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12.r),
                                ),
                              ),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    // Fallback (should never happen)
    return const SizedBox.shrink();
  }
}
