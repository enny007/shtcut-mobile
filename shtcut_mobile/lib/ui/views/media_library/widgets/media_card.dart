import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:intl/intl.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';

enum MediaType { image, video, file, folder }

class MediaCard extends StatelessWidget {
  final String name;
  final DateTime date;
  final MediaType type;
  final String? thumbnailUrl;
  final String? fileFormat;
  final bool isSelected;
  final VoidCallback onSelect;
  final VoidCallback onTap;

  const MediaCard({
    Key? key,
    required this.name,
    required this.date,
    required this.type,
    this.thumbnailUrl,
    this.fileFormat,
    this.isSelected = false,
    required this.onSelect,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 162.w,
        height: 188.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .1),
              offset: const Offset(0, 4),
              blurRadius: 20,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail section with selection circle
            Stack(
              children: [
                // Thumbnail container
                Container(
                  width: double.infinity,
                  height: 105.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    color: const Color(0xFFF5F5F5),
                  ),
                  child: _buildThumbnail(),
                ),

                // Selection circle
                Positioned(
                  top: 8.h,
                  left: 8.w,
                  child: GestureDetector(
                    onTap: onSelect,
                    child: Container(
                      width: 20.w,
                      height: 20.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? kcPrimaryColor : Colors.white,
                        border: Border.all(
                          color: isSelected ? kcPrimaryColor : Colors.grey,
                          width: 1.5,
                        ),
                      ),
                      child: isSelected
                          ? Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 14.sp,
                            )
                          : null,
                    ),
                  ),
                ),
              ],
            ),

            // Details section
            Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // File name
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  Divider(
                    height: 1.h,
                    thickness: 1.h,
                    color: Colors.grey.withValues(alpha: .1),
                  ),

                  // Date and type
                  Text(
                    DateFormat('dd/MM/yyyy').format(date),
                    style: context.bodySmall!.copyWith(
                      color: const Color(0xff727272),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Gap(2.h),
                  // Type
                  Text(
                    _getTypeText(),
                    style: context.bodySmall!.copyWith(
                      color: kcPrimaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    switch (type) {
      case MediaType.image:
        return thumbnailUrl != null
            ? ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.r),
                  topRight: Radius.circular(8.r),
                ),
                child: Image.network(
                  thumbnailUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: double.infinity,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder(Icons.image, Colors.blue);
                  },
                ),
              )
            : _buildPlaceholder(Icons.image, Colors.blue);

      case MediaType.video:
        return Stack(
          fit: StackFit.expand,
          children: [
            thumbnailUrl != null
                ? ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8.r),
                      topRight: Radius.circular(8.r),
                    ),
                    child: Image.network(
                      thumbnailUrl!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return _buildPlaceholder(Icons.video_file, Colors.red);
                      },
                    ),
                  )
                : _buildPlaceholder(Icons.video_file, Colors.red),
            Center(
              child: Container(
                width: 30.w,
                height: 30.h,
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: .5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 20.sp,
                ),
              ),
            ),
          ],
        );

      case MediaType.file:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getFileIcon(),
                size: 40.sp,
                color: _getFileColor(),
              ),
              SizedBox(height: 8.h),
              Text(
                fileFormat?.toUpperCase() ?? 'FILE',
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                  color: _getFileColor(),
                ),
              ),
            ],
          ),
        );

      case MediaType.folder:
        return Center(
          child: Icon(
            Icons.folder,
            size: 50.sp,
            color: Colors.amber,
          ),
        );
    }
  }

  Widget _buildPlaceholder(IconData icon, Color color) {
    return Center(
      child: Icon(
        icon,
        size: 40.sp,
        color: color,
      ),
    );
  }

  IconData _getFileIcon() {
    if (fileFormat == null) return Icons.insert_drive_file;

    switch (fileFormat!.toLowerCase()) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'doc':
      case 'docx':
        return Icons.description;
      case 'xls':
      case 'xlsx':
        return Icons.table_chart;
      case 'ppt':
      case 'pptx':
        return Icons.slideshow;
      case 'txt':
        return Icons.text_snippet;
      default:
        return Icons.insert_drive_file;
    }
  }

  Color _getFileColor() {
    if (fileFormat == null) return Colors.grey;

    switch (fileFormat!.toLowerCase()) {
      case 'pdf':
        return Colors.red;
      case 'doc':
      case 'docx':
        return Colors.blue;
      case 'xls':
      case 'xlsx':
        return Colors.green;
      case 'ppt':
      case 'pptx':
        return Colors.orange;
      case 'txt':
        return Colors.purple;
      default:
        return Colors.grey;
    }
  }

  String _getTypeText() {
    switch (type) {
      case MediaType.image:
        return 'Image';
      case MediaType.video:
        return 'Video';
      case MediaType.file:
        return fileFormat?.toUpperCase() ?? 'File';
      case MediaType.folder:
        return 'Folder';
    }
  }
}
