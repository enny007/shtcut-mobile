import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class SocialCard extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final List<String> postImages;
  final String caption;
  final int likesCount;
  final int commentsCount;
  final bool isLiked;
  final bool isBookmarked;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onBookmark;
  final VoidCallback onMoreOptions;

  const SocialCard({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.postImages,
    required this.caption,
    this.likesCount = 0,
    this.commentsCount = 0,
    this.isLiked = false,
    this.isBookmarked = false,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onBookmark,
    required this.onMoreOptions,
  }) : super(key: key);

  @override
  State<SocialCard> createState() => _SocialCardState();
}

class _SocialCardState extends State<SocialCard> {
  int _currentImageIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextImage() {
    if (_currentImageIndex < widget.postImages.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void _previousImage() {
    if (_currentImageIndex > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
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
          // Header with profile picture, name, and more options
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Row(
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 20.r,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                Gap(10.w),
                // Username and sponsored text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.username,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14.sp,
                        ),
                      ),
                      Text(
                        'Sponsored',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                // More options button
                IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    size: 24.r,
                  ),
                  onPressed: widget.onMoreOptions,
                ),
              ],
            ),
          ),

          // Post images with pagination
          SizedBox(
            height: 348.h,
            width: 363.w,
            child: Stack(
              children: [
                // Image carousel
                PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentImageIndex = index;
                    });
                  },
                  itemCount: widget.postImages.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: NetworkImage(widget.postImages[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),

                // Navigation arrows (only show if there are multiple images)
                if (widget.postImages.length > 1) ...[
                  // Left arrow
                  Positioned(
                    left: 10.w,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: _previousImage,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 14.r,
                      ),
                    ),
                  ),

                  // Right arrow
                  Positioned(
                    right: 10.w,
                    top: 0,
                    bottom: 0,
                    child: GestureDetector(
                      onTap: _nextImage,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 14.r,
                      ),
                    ),
                  ),
                ],

                // Pagination dots
              ],
            ),
          ),
          Gap(5.h),
          if (widget.postImages.length > 1)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                widget.postImages.length,
                (index) => Container(
                  width: 4.w,
                  height: 4.h,
                  margin: EdgeInsets.symmetric(horizontal: 2.w),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentImageIndex == index
                        ? kcPrimaryColor
                        : Colors.grey.withValues(alpha: .5),
                  ),
                ),
              ),
            ),
          // Action buttons (like, comment, share, bookmark)
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h),
            child: Row(
              children: [
                // Like button
                IconButton(
                  icon: Icon(
                    widget.isLiked ? Icons.favorite : Icons.favorite_border,
                    color: widget.isLiked ? Colors.red : Colors.black,
                    size: 24.r,
                  ),
                  onPressed: widget.onLike,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
                // Gap(3.w),

                // Comment button
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/svgs/comment_svg.svg',
                    width: 22.w,
                    height: 22.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: widget.onComment,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),

                // Share button
                IconButton(
                  icon: SvgPicture.asset(
                    'assets/svgs/send_svg.svg',
                    width: 22.w,
                    height: 22.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.black,
                      BlendMode.srcIn,
                    ),
                  ),
                  onPressed: widget.onShare,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),

                const Spacer(),

                // Bookmark button
                IconButton(
                  icon: Icon(
                    widget.isBookmarked
                        ? Icons.bookmark
                        : Icons.bookmark_border,
                    size: 24.r,
                  ),
                  onPressed: widget.onBookmark,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ],
            ),
          ),

          // Divider
          Divider(
            color: const Color(0xFFE9EAEB),
            thickness: 0.5.h,
            height: 1.h,
          ),

          // Caption
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Likes count
                Text(
                  '${widget.likesCount} likes',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(4.h),

                // Caption
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                    ),
                    children: [
                      TextSpan(
                        text: '${widget.username} ',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: widget.caption,
                      ),
                    ],
                  ),
                ),

                // View all comments
                if (widget.commentsCount > 0)
                  Padding(
                    padding: EdgeInsets.only(top: 8.h),
                    child: Text(
                      'View all ${widget.commentsCount} comments',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14.sp,
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
}
