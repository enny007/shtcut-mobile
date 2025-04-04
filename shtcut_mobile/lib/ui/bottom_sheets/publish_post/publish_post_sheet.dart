import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/publish_post/publish_post_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PublishPostSheet extends StackedView<PublishPostModel> {
  const PublishPostSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, PublishPostModel viewModel, Widget? child) {
    return SheetWidget(
      height: 250.h,
      icon: SvgPicture.asset('assets/svgs/publish_svg.svg'),
      children: [
        Text(
          'Post Published',
          style: context.displayMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),
        Gap(16.h),
        Text(
          'You have successfully published this post. Go to your calendar to view your live and scheduled posts.',
          style: context.bodySmall!.copyWith(),
          textAlign: TextAlign.center,
        ),
        Gap(32.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: false));
          },
          text: 'Done',
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  PublishPostModel viewModelBuilder(BuildContext context) {
    return PublishPostModel();
  }
}
