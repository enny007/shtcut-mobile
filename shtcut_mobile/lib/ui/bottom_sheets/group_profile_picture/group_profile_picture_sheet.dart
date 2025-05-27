import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/group_profile_picture/group_profile_picture_model.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class GroupProfilePictureSheet extends StackedView<GroupProfilePictureModel> {
  const GroupProfilePictureSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, GroupProfilePictureModel viewModel, Widget? child) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 23.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with title and close button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Add Profile Picture',
                style: context.displaySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: const Color(0xff101828),
                ),
              ),
              GestureDetector(
                onTap: () => viewModel.closeSheet(completer!),
                child: const Icon(
                  Icons.close,
                  color: Color(0xff101828),
                  size: 20,
                ),
              ),
            ],
          ),
          SizedBox(height: 30.h),

          // Take photo option
          GestureDetector(
            onTap: () => viewModel.takePhoto(completer!),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/grey_camera.svg',
                  ),
                  Gap(10.w),
                  Text(
                    'Take a Photo',
                    style: context.bodySmall!.copyWith(
                      color: const Color(0xff433E3F),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(6.h),
          // Choose from gallery option
          GestureDetector(
            onTap: () => viewModel.chooseFromGallery(completer!),
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
                horizontal: 12.w,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffFAFAFA),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/grey_image.svg',
                  ),
                  Gap(10.w),
                  Text(
                    'Choose Photo',
                    style: context.bodySmall!.copyWith(
                      color: const Color(0xff433E3F),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  @override
  GroupProfilePictureModel viewModelBuilder(BuildContext context) {
    return GroupProfilePictureModel();
  }
}
