import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/post_publish/post_publish_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PostPublishSheet extends StackedView<PostPublishModel> {
  const PostPublishSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, PostPublishModel viewModel, Widget? child) {
    return SheetWidget(
      height: 360.h,
      icon: SvgPicture.asset('assets/svgs/publish_svg.svg'),
      children: [
        Text(
          'Are you sure you want to publish this post? ',
          style: context.displayMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'To upload photos or videos from your device, apply effects to your photos, and download posts, allow access to your photos.',
          style: context.bodySmall!.copyWith(),
          textAlign: TextAlign.center,
        ),
        Gap(34.h),
        AppButton(
          callback: () {
            viewModel.showSuccessfulPostSheet();
          },
          text: 'Post Now',
          color: kcPrimaryColor,
        ),
        Gap(8.h),
        AppButton(
          callback: () {
            viewModel.navigateToEditPost();
          },
          text: 'Edit',
          textColor: kcPrimaryColor,
          color: Colors.transparent,
          border: Border.all(
            width: 2,
            color: kcPrimaryColor,
          ),
        ),
      ],
    );
  }

  @override
  PostPublishModel viewModelBuilder(BuildContext context) {
    return PostPublishModel();
  }
}
