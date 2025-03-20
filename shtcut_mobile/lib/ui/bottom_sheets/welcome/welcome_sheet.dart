import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/welcome/welcome_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class WelcomeSheet extends StackedView<WelcomeModel> {
  const WelcomeSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(BuildContext context, WelcomeModel viewModel, Widget? child) {
    return SheetWidget(
      icon: SvgPicture.asset('assets/svgs/welcome_user.svg'),
      children: [
        Text(
          'Welcome To Shtcut Social Media Manager!',
          style: context.displaySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: kcPrimaryTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'To enhance your user experience, please set up your profile first. This will help us tailor the app to your needs and ensure you get the most out of our features!',
          style: context.bodySmall!.copyWith(
            color: kcSubHeadingColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(70.h),
        AppButton(
          text: 'Set up my social media',
          callback: viewModel.navigateToConnectSocials,
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  WelcomeModel viewModelBuilder(BuildContext context) {
    return WelcomeModel(completer);
  }
}
