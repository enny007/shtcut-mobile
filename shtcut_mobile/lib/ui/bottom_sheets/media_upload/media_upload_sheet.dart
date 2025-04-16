import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/media_upload/media_upload_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/dotted_border.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class MediaUploadSheet extends StackedView<MediaUploadModel> {
  const MediaUploadSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, MediaUploadModel viewModel, Widget? child) {
    return Container(
      height: 320.h,
      padding: EdgeInsets.symmetric(
        horizontal: 15.w,
        vertical: 10.h,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              onTap: () => completer!(SheetResponse(confirmed: true)),
              child: const Icon(
                Icons.close,
                color: Color(0xff433E3F),
              ),
            ),
          ),
          Gap(8.h),
          Text(
            'Media Upload',
            style: context.displaySmall!.copyWith(
              fontSize: 18.sp,
              color: const Color(0xff101828),
            ),
          ),
          Gap(4.h),
          Text(
            'Add your documents here, and you can upload up to 5 files max',
            style: context.bodySmall!.copyWith(
              color: const Color(0xff726C6C),
            ),
          ),
          Gap(15.h),
          DottedBorderContainer(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  'assets/svgs/folder-open.svg',
                  height: 32.h,
                  width: 32.w,
                  colorFilter: const ColorFilter.mode(
                    kcPrimaryColor,
                    BlendMode.srcIn,
                  ),
                ),
                Gap(12.h),
                Text(
                  'Start uploading',
                  style: context.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff0B0B0B),
                  ),
                ),
                Gap(16.h),

                // Or with dividers
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: Color(0xffE7E7E7),
                        thickness: 1,
                        indent: 50,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Text(
                        'Or',
                        style: context.bodySmall!.copyWith(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: Color(0xffE7E7E7),
                        thickness: 1,
                        endIndent: 50,
                      ),
                    ),
                  ],
                ),
                Gap(16.h),

                Container(
                  height: 30.h,
                  width: 95.w,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(
                        color: kcPrimaryColor,
                      )),
                  alignment: Alignment.center,
                  child: Text(
                    'Browse Files',
                    style: context.bodySmall!.copyWith(
                      color: kcPrimaryColor,
                    ),
                  ),
                ),
                // Browse button
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  MediaUploadModel viewModelBuilder(BuildContext context) {
    return MediaUploadModel();
  }
}
