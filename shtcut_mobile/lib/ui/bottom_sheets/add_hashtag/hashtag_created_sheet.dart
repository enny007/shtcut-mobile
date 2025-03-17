import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/add_hashtag/add_hashtag_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HashtagCreatedSheet extends StackedView<AddHashtagModel> {
  const HashtagCreatedSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, AddHashtagModel viewModel, Widget? child) {
    return SheetWidget(
      height: 267.h,
      icon: SvgPicture.asset('assets/svgs/hashtag_sheet.svg'),
      children: [
        Text(
          'Hashtag Created',
          style: context.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'Your hashtag has been created successfully',
          style: context.bodyMedium!.copyWith(
            color: kcTextColor,
          ),
        ),
        Gap(32.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          text: 'Done',
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  AddHashtagModel viewModelBuilder(BuildContext context) {
    return AddHashtagModel();
  }
}
