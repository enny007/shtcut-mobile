import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/schedule_post/schedule_post_model.dart';
import 'package:shtcut_mobile/ui/global_widgets/custom_calendar.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/schedule_post/widgets/time_selector.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SchedulePostSheet extends StackedView<SchedulePostModel> {
  const SchedulePostSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, SchedulePostModel viewModel, Widget? child) {
    return SheetWidget(
      height: 600.h,
      icon: SvgPicture.asset('assets/svgs/schedule_svg.svg'),
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Schedule this Post',
            style: context.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: const Color(0xff101828),
            ),
          ),
        ),
        Gap(10.h),
        CustomCalendar(
          days: viewModel.getDaysInMonth(),
          displayedMonth: viewModel.displayedMonth,
          onSelectDate: viewModel.selectDate,
          isCurrentMonth: viewModel.isCurrentMonth,
          isSelectedDate: viewModel.isSelectedDate,
          isToday: viewModel.isToday,
          availableYears: viewModel.availableYears,
          selectedYear: viewModel.selectedYear,
          selectedMonth: viewModel.selectedMonth,
          onYearChanged: viewModel.changeYear,
          onMonthChanged: viewModel.changeMonth,
        ),
        Gap(16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Time',
              style: context.bodyLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: const Color(0xff101828),
              ),
            ),
            TimeSelector(
              initialTime: viewModel.selectedTime,
              onTimeChanged: viewModel.setSelectedTime,
            ),
          ],
        ),
        Gap(19.h),
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
        Gap(8.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: false));
          },
          text: 'Save',
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  SchedulePostModel viewModelBuilder(BuildContext context) {
    return SchedulePostModel();
  }
}
