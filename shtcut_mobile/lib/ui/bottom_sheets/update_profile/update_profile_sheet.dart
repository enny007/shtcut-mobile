import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/update_profile/update_profile_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class UpdateProfileSheet extends StackedView<UpdateProfileModel> {
  const UpdateProfileSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, UpdateProfileModel viewModel, Widget? child) {
    return SheetWidget(
      icon: SvgPicture.asset('assets/svgs/update_profile.svg'),
      children: [
        Text(
          'Update Profile',
          style: context.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'Are you sure you want to update your profile? This will help us improve your experience and provide personalized features.',
          style: context.bodyMedium!.copyWith(
            color: kcTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(24.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: true));
            viewModel.showUpdatedProfile();
          },
          text: 'Yes,Proceed',
          color: kcPrimaryColor,
        ),
        Gap(8.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: false));
          },
          text: 'Cancel',
          color: Colors.transparent,
          textColor: kcPrimaryColor,
          border: Border.all(
            width: 2.w,
            color: kcPrimaryColor,
          ),
        ),
      ],
    );
  }

  @override
  UpdateProfileModel viewModelBuilder(BuildContext context) {
    return UpdateProfileModel();
  }
}
