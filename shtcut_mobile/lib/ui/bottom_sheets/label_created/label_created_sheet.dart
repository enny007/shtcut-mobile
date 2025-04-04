import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/label_created/label_created_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LabelCreatedSheet extends StackedView<LabelCreatedModel> {
  const LabelCreatedSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, LabelCreatedModel viewModel, Widget? child) {
    return SheetWidget(
      height: 250.h,
      icon: SvgPicture.asset(
        'assets/svgs/sheet_tag.svg',
      ),
      children: [
        Text(
          'Label Created',
          style: context.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'Your label has been created successfully',
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
  LabelCreatedModel viewModelBuilder(BuildContext context) {
    return LabelCreatedModel();
  }
}
