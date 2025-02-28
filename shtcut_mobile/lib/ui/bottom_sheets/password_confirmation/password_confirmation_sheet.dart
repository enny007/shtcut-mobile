import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/password_confirmation/password_confirmation_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PasswordConfirmationSheet extends StackedView<PasswordConfirmationModel> {
  const PasswordConfirmationSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(BuildContext context, PasswordConfirmationModel viewModel,
      Widget? child) {
    return SheetWidget(
      height: 300.h,
      icon: SvgPicture.asset('assets/svgs/password_icon.svg'),
      children: [
        Text(
          'Password Has Been Created',
          style: context.displaySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: kcPrimaryTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'To log in to your account, click the Sign in button and enter your email along with your new password.',
          style: context.bodySmall!.copyWith(
            color: kcSubHeadingColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(70.h),
        AppButton(
          text: 'Set up my social media',
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  PasswordConfirmationModel viewModelBuilder(BuildContext context) {
    return PasswordConfirmationModel();
  }
}
