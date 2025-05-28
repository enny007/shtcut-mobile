import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class TikTokPreviewCard extends StatefulWidget {
  final String profileImageUrl;
  final String username;
  final String caption;
  final List<String> mediaUrls;
  final bool isVideo;
  final String? soundName;

  const TikTokPreviewCard({
    Key? key,
    required this.profileImageUrl,
    required this.username,
    required this.caption,
    required this.mediaUrls,
    this.isVideo = false,
    this.soundName,
  }) : super(key: key);

  @override
  State<TikTokPreviewCard> createState() => _TikTokPreviewCardState();
}

class _TikTokPreviewCardState extends State<TikTokPreviewCard> {
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
          //     color: Color(0xFFFFE7EA),
          //     borderRadius: BorderRadius.only(
          //       topLeft: Radius.circular(7),
          //       topRight: Radius.circular(7),
          //     ),
          //   ),
          //   child: Center(
          //     child: Text(
          //       'TIKTOK PREVIEW',
          //       style: TextStyle(
          //         color: const Color(0xFFFF004F),
          //         fontWeight: FontWeight.bold,
          //         fontSize: 12.sp,
          //       ),
          //     ),
          //   ),
          // ),

          // Media content (video thumbnail or images)
          _buildMediaContent(),

          // Caption and sound info
          Padding(
            padding: EdgeInsets.all(12.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Caption with username
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      height: 1.3,
                    ),
                    children: [
                      TextSpan(
                        text: '@${widget.username} ',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: widget.caption,
                      ),
                    ],
                  ),
                ),

                Gap(8.h),

                // Sound info (if provided)
                if (widget.soundName != null)
                  Row(
                    children: [
                      Icon(
                        Icons.music_note,
                        size: 16.r,
                        color: Colors.grey[700],
                      ),
                      Gap(4.w),
                      Expanded(
                        child: Text(
                          widget.soundName!,
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: Colors.grey[700],
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),

          // Bottom profile info
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r, vertical: 8.h),
            child: Row(
              children: [
                // Profile picture
                CircleAvatar(
                  radius: 16.r,
                  backgroundImage: NetworkImage(widget.profileImageUrl),
                ),
                Gap(8.w),

                // Username
                Text(
                  '@${widget.username}',
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),

                const Spacer(),

                // TikTok logo
                Container(
                  padding: EdgeInsets.all(4.r),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  child: Text(
                    'TikTok',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
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

  Widget _buildMediaContent() {
    if (widget.isVideo) {
      // For video content, show a thumbnail with play button
      return Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 400.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black,
              image: DecorationImage(
                image: NetworkImage(widget.mediaUrls.first),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Play button overlay
          Container(
            width: 50.w,
            height: 50.h,
            decoration: BoxDecoration(
              color: Colors.black.withValues(alpha: .5),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.play_arrow,
              color: Colors.white,
              size: 30.r,
            ),
          ),
        ],
      );
    } else {
      // For multiple images, use PageView with indicators
      return Stack(
        children: [
          SizedBox(
            height: 400.h,
            width: double.infinity,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentImageIndex = index;
                });
              },
              itemCount: widget.mediaUrls.length,
              itemBuilder: (context, index) {
                return Image.network(
                  widget.mediaUrls[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),

          // Page indicators
          if (widget.mediaUrls.length > 1)
            Positioned(
              bottom: 16.h,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.mediaUrls.length,
                  (index) => Container(
                    width: 8.w,
                    height: 8.h,
                    margin: EdgeInsets.symmetric(horizontal: 2.w),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentImageIndex == index
                          ? const Color(0xFFFF004F)
                          : Colors.white.withValues(alpha: .6),
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
