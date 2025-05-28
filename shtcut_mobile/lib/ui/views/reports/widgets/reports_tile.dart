import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

class ReportsTile extends StatefulWidget {
  final String profileImagePath;
  final String socialMediaIcon;
  final String userName;
  final String actionText; // "comment" or "wellness"
  final String postContent;
  final String timeAgo;
  final VoidCallback? onLike;
  final Function(String)? onReplySubmit;
  final VoidCallback? onShare;
  final VoidCallback? onTag;

  const ReportsTile({
    super.key,
    required this.profileImagePath,
    required this.socialMediaIcon,
    required this.userName,
    required this.actionText,
    required this.postContent,
    required this.timeAgo,
    this.onLike,
    this.onReplySubmit,
    this.onShare,
    this.onTag,
  });

  @override
  State<ReportsTile> createState() => _ReportsTileState();
}

class _ReportsTileState extends State<ReportsTile> {
  bool _showReplyField = false;
  final TextEditingController _replyController = TextEditingController();
  final FocusNode _replyFocusNode = FocusNode();

  @override
  void dispose() {
    _replyController.dispose();
    _replyFocusNode.dispose();
    super.dispose();
  }

  void _toggleReplyField() {
    setState(() {
      _showReplyField = !_showReplyField;
    });

    if (_showReplyField) {
      // Focus the text field when showing
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _replyFocusNode.requestFocus();
      });
    } else {
      // Clear the text field when hiding
      _replyController.clear();
      _replyFocusNode.unfocus();
    }
  }

  void _submitReply() {
    if (_replyController.text.trim().isNotEmpty) {
      widget.onReplySubmit?.call(_replyController.text.trim());
      _replyController.clear();
      setState(() {
        _showReplyField = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14.w,
        vertical: 16.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.19.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // First Row - Profile, Name, Action, Tag
          Row(
            children: [
              // Profile picture with social media icon
              Stack(
                children: [
                  CircleAvatar(
                    radius: 20.r,
                    backgroundImage: AssetImage(widget.profileImagePath),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 16.w,
                      height: 16.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.white,
                          width: 1,
                        ),
                      ),
                      child: SvgPicture.asset(
                        widget.socialMediaIcon,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(12.w),
              Text(
                widget.userName,
                style: context.bodyMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Gap(8.w),
              // Name and action text
              Expanded(
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: widget.userName,
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xff101828),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text: ' ${widget.actionText}',
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xff475467),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // Tag icon
              GestureDetector(
                onTap: widget.onTag,
                child: Container(
                  padding: EdgeInsets.all(6.w),
                  decoration: BoxDecoration(
                    color: const Color(0xffF9FAFB),
                    borderRadius: BorderRadius.circular(6.r),
                  ),
                  child: SvgPicture.asset(
                    'assets/svgs/tag.svg', // Replace with your tag icon
                    width: 16.w,
                    height: 16.h,
                    colorFilter: const ColorFilter.mode(
                      Color(0xff475467),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(12.h),
          // Second Row - Post Content
          Text(
            widget.postContent,
            style: context.bodyMedium!.copyWith(
              color: const Color(0xff101828),
              height: 1.5,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Gap(16.h),
          // Third Row - Actions and Time
          Row(
            children: [
              // Like button
              GestureDetector(
                onTap: widget.onLike,
                child: SvgPicture.asset(
                  'assets/svgs/heart.svg', // Replace with your like icon
                  width: 16.w,
                  height: 16.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff475467),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Gap(20.w),
              // Reply button
              GestureDetector(
                onTap: _toggleReplyField,
                child: SvgPicture.asset(
                  'assets/svgs/message.svg', // Replace with your reply icon
                  width: 16.w,
                  height: 16.h,
                  colorFilter: ColorFilter.mode(
                    _showReplyField ? kcPrimaryColor : const Color(0xff475467),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              Gap(20.w),
              // Share button
              GestureDetector(
                onTap: widget.onShare,
                child: SvgPicture.asset(
                  'assets/svgs/share.svg', // Replace with your share icon
                  width: 16.w,
                  height: 16.h,
                  colorFilter: const ColorFilter.mode(
                    Color(0xff475467),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const Spacer(),
              // Time
              Text(
                widget.timeAgo,
                style: context.bodySmall!.copyWith(
                  color: const Color(0xff98A2B3),
                ),
              ),
            ],
          ),
          // Reply Text Field (conditionally shown)
          if (_showReplyField) ...[
            Gap(12.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 12.w,
                vertical: 8.h,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: const Color(0xffE4E7EC),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _replyController,
                      focusNode: _replyFocusNode,
                      decoration: InputDecoration(
                        hintText: 'Write a reply...',
                        hintStyle: context.bodySmall!.copyWith(
                          color: const Color(0xff98A2B3),
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: context.bodySmall!.copyWith(
                        color: const Color(0xff101828),
                      ),
                      maxLines: null,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _submitReply(),
                    ),
                  ),
                  Gap(8.w),
                  GestureDetector(
                    onTap: _submitReply,
                    child: Container(
                      padding: EdgeInsets.all(6.w),
                      decoration: BoxDecoration(
                        color: kcPrimaryColor,
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: SvgPicture.asset(
                        'assets/svgs/send.svg', // Replace with your send icon
                        width: 14.w,
                        height: 14.h,
                        colorFilter: const ColorFilter.mode(
                          Colors.white,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
