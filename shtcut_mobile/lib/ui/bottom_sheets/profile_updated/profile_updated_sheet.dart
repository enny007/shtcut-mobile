import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/profile_updated/profile_updated_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileUpdatedSheet extends StackedView<ProfileUpdatedModel> {
  const ProfileUpdatedSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, ProfileUpdatedModel viewModel, Widget? child) {
    return SheetWidget(
      height: 270.h,
      icon: SvgPicture.asset('assets/svgs/update_profile.svg'),
      children: [
        Text(
          'Profile Updated',
          style: context.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'Your profile has been successfully updated. We\'re excited to see you take this step!',
          style: context.bodyMedium!.copyWith(
            color: kcTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(26.h),
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
  ProfileUpdatedModel viewModelBuilder(BuildContext context) {
    return ProfileUpdatedModel();
  }
}
