import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/create_new_task/create_new_task_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateNewTaskSheet extends StackedView<CreateNewTaskModel> {
  const CreateNewTaskSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, CreateNewTaskModel viewModel, Widget? child) {
    return SheetWidget(
      height: 320.h,
      icon: SvgPicture.asset('assets/svgs/task_sheet_icon.svg'),
      children: [
        Text(
          'Create New Task',
          style: context.bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(16.h),
        Text(
          'Double-check your task details to ensure everything is correct. Do you want to proceed?',
          style: context.bodyMedium!.copyWith(
            color: kcTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        Gap(31.h),
        AppButton(
          callback: () {
            viewModel.showTaskCreated();
          },
          text: 'Yes, Proceed',
          color: kcPrimaryColor,
        ),
        Gap(8.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          text: 'Return',
          border: Border.all(
            color: kcPrimaryColor,
            width: 2.w,
          ),
          textColor: kcPrimaryColor,
          color: Colors.transparent,
        ),
      ],
    );
  }

  @override
  CreateNewTaskModel viewModelBuilder(BuildContext context) {
    return CreateNewTaskModel();
  }
}
