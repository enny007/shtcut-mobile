import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/core/service/media_service.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class MediaPreviewRow extends StatelessWidget {
  final List<MediaItem> mediaItems;
  final Function(int) onRemove;

  const MediaPreviewRow({
    Key? key,
    required this.mediaItems,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (mediaItems.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Selected Media (${mediaItems.length}/10)',
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: const Color(0xff101828),
          ),
        ),
        Gap(8.h),
        SizedBox(
          height: 100.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: mediaItems.length,
            separatorBuilder: (context, index) => Gap(8.w),
            itemBuilder: (context, index) {
              final item = mediaItems[index];
              return Stack(
                children: [
                  Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: _buildMediaPreview(item),
                  ),
                  Positioned(
                    top: 4.h,
                    right: 4.w,
                    child: GestureDetector(
                      onTap: () => onRemove(index),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 16.r,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMediaPreview(MediaItem item) {
    switch (item.type) {
      case MediaType.image:
        return Image.file(
          item.file,
          fit: BoxFit.cover,
          height: double.infinity,
          width: double.infinity,
        );
      case MediaType.video:
        return Container(
          color: Colors.black,
          child: Center(
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 32.r,
            ),
          ),
        );
      case MediaType.file:
        return Container(
          color: Colors.grey.shade100,
          padding: EdgeInsets.all(8.r),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.insert_drive_file,
                color: kcPrimaryColor,
                size: 32.r,
              ),
              Gap(4.h),
              Text(
                item.fileName ?? 'File',
                style: TextStyle(
                  fontSize: 10.sp,
                  overflow: TextOverflow.ellipsis,
                ),
                maxLines: 1,
              ),
            ],
          ),
        );
    }
  }
}
