import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/task_created/task_created_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class TaskCreatedSheet extends StackedView<TaskCreatedModel> {
  const TaskCreatedSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, TaskCreatedModel viewModel, Widget? child) {
    return SheetWidget(
      height: 270.h,
      icon: SvgPicture.asset('assets/svgs/task_sheet_icon.svg'),
      children: [
        Text(
          'Task created',
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
            completer!(SheetResponse(confirmed: false));
          },
          text: 'Done',
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  TaskCreatedModel viewModelBuilder(BuildContext context) {
    return TaskCreatedModel();
  }
}
