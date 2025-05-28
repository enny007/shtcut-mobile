import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LinkedInPreviewCard extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String userTitle;
  final String postText;
  final List<String>? postImages;

  const LinkedInPreviewCard({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.userTitle,
    required this.postText,
    this.postImages,
  }) : super(key: key);

  @override
  State<LinkedInPreviewCard> createState() => _LinkedInPreviewCardState();
}

class _LinkedInPreviewCardState extends State<LinkedInPreviewCard> {
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

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
          //     color: Color(0xFFE6F0F9),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(7),
          //       topRight: Radius.circular(7),
          //     ),
          //   ),
          //   child: Center(
          //     child: Text(
          //       'LINKEDIN PREVIEW',
          //       style: TextStyle(
          //         color: const Color(0xFF0077B5),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 12.sp,
          //       ),
          //     ),
          //   ),
          // ),

          // Header with profile picture, name, and job title
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 24.r,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                Gap(10.w),

                // Username and job title
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15.sp,
                        ),
                      ),
                      Text(
                        widget.userTitle,
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 13.sp,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Just now',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 12.sp,
                            ),
                          ),
                          Gap(4.w),
                          Icon(
                            Icons.public,
                            size: 12.r,
                            color: Colors.grey[600],
                          ),
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
                  fontSize: 14.sp,
                  height: 1.4,
                ),
              ),
            ),

          Gap(12.h),

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

    if (images.length == 1) {
      // Single image
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
    } else {
      // Multiple images with carousel
      return Column(
        children: [
          SizedBox(
            height: 250.h,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Image.network(
                  images[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          // Image indicators
          if (images.length > 1)
            Padding(
              padding: EdgeInsets.only(top: 8.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  images.length,
                  (index) => Container(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentImageIndex == index
                          ? const Color(0xFF0077B5)
                          : Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ),
        ],
      );
    }
  }
}
