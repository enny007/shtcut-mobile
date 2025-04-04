import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class CustomCalendar extends StatelessWidget {
  final List<DateTime> days;
  final DateTime displayedMonth;
  final Function(DateTime) onSelectDate;
  final bool Function(DateTime) isCurrentMonth;
  final bool Function(DateTime) isSelectedDate;
  final bool Function(DateTime) isToday;
  final List<int> availableYears;
  final int selectedYear;
  final int selectedMonth;
  final Function(int) onYearChanged;
  final Function(int) onMonthChanged;

  const CustomCalendar({
    Key? key,
    required this.days,
    required this.displayedMonth,
    required this.onSelectDate,
    required this.isCurrentMonth,
    required this.isSelectedDate,
    required this.isToday,
    required this.availableYears,
    required this.selectedYear,
    required this.selectedMonth,
    required this.onYearChanged,
    required this.onMonthChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Month and Year Selector
        _buildMonthYearSelector(context),

        Gap(11.3.h),

        // Days of Week Header
        _buildDaysOfWeekHeader(context),

        Gap(8.h),

        // Calendar Grid
        _buildCalendarGrid(context),
      ],
    );
  }

  Widget _buildMonthYearSelector(BuildContext context) {
    // Month names
    final List<String> monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Month Dropdown
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFCCCBCB)),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: selectedMonth,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                items: List.generate(12, (index) {
                  return DropdownMenuItem<int>(
                    value: index + 1,
                    child: Text(monthNames[index]),
                  );
                }),
                onChanged: (value) {
                  if (value != null) {
                    onMonthChanged(value);
                  }
                },
              ),
            ),
          ),
        ),

        SizedBox(width: 12.w),

        // Year Dropdown
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            decoration: BoxDecoration(
              border: Border.all(color: const Color(0xFFCCCBCB)),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: selectedYear,
                isExpanded: true,
                icon: const Icon(Icons.arrow_drop_down),
                items: availableYears.map((year) {
                  return DropdownMenuItem<int>(
                    value: year,
                    child: Text(year.toString()),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    onYearChanged(value);
                  }
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDaysOfWeekHeader(BuildContext context) {
    final List<String> daysOfWeek = [
      'Sun',
      'Mon',
      'Tue',
      'Wed',
      'Thu',
      'Fri',
      'Sat',
    ];

    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(4.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: daysOfWeek.map((day) {
          return Container(
            width: 40.w,
            // margin: EdgeInsets.symmetric(horizontal: .w),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(2.r),
            ),
            child: Text(
              day,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: Colors.grey[700],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildCalendarGrid(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 7,
        childAspectRatio: 1.6,
        crossAxisSpacing: 4.w,
        mainAxisSpacing: 4.h,
      ),
      itemCount: days.length,
      itemBuilder: (context, index) {
        final date = days[index];
        final isInCurrentMonth = isCurrentMonth(date);
        final isSelected = isSelectedDate(date);
        final isTodayDate = isToday(date);

        return GestureDetector(
          onTap: () {
            onSelectDate(date);
          },
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? kcPrimaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(24.r),
              border: isTodayDate && !isSelected
                  ? Border.all(color: kcPrimaryColor, width: 1.w)
                  : null,
            ),
            child: Center(
              child: Text(
                date.day.toString(),
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: isSelected || isTodayDate
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: isSelected
                      ? Colors.white
                      : isInCurrentMonth
                          ? Colors.black
                          : Colors.grey,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
