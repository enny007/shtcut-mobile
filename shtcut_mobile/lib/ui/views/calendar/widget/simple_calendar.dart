import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

typedef DayBuilder = Widget Function(
    BuildContext context, DateTime date, bool isSelectable);

class SimpleCalendar extends StatelessWidget {
  final List<DateTime> days;
  final DateTime displayedMonth;
  final Function(DateTime) onSelectDate;
  final bool Function(DateTime) isCurrentMonth;
  final bool Function(DateTime) isSelectedDate;
  final bool Function(DateTime) isToday;
  final Function() onNextMonth;
  final Function() onPreviousMonth;
  final DayBuilder? dayBuilder;

  const SimpleCalendar({
    Key? key,
    required this.days,
    required this.displayedMonth,
    required this.onSelectDate,
    required this.isCurrentMonth,
    required this.isSelectedDate,
    required this.isToday,
    required this.onNextMonth,
    required this.onPreviousMonth,
    this.dayBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Month and Year header with arrows
        _buildMonthYearHeader(context),

        Gap(11.3.h),

        // Days of Week Header
        _buildDaysOfWeekHeader(context),

        Gap(8.h),

        // Calendar Grid
        _buildCalendarGrid(context),
      ],
    );
  }

  Widget _buildMonthYearHeader(BuildContext context) {
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
        // Previous month button
        IconButton(
          onPressed: onPreviousMonth,
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 30,
            color: kcPrimaryColor,
          ),
        ),

        // Current month and year
        Text(
          '${monthNames[displayedMonth.month - 1]} ${displayedMonth.year}',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        // Next month button
        IconButton(
          onPressed: onNextMonth,
          icon: const Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: kcPrimaryColor,
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
            if (isInCurrentMonth) {
              onSelectDate(date);
            }
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
              child: dayBuilder != null
                  ? dayBuilder!(context, date, isInCurrentMonth)
                  : _defaultDayBuilder(
                      context, date, isInCurrentMonth, isSelected, isTodayDate),
            ),
          ),
        );
      },
    );
  }

  // Default day builder if custom one is not provided
  Widget _defaultDayBuilder(BuildContext context, DateTime date,
      bool isInCurrentMonth, bool isSelected, bool isTodayDate) {
    return Text(
      date.day.toString(),
      style: TextStyle(
        fontSize: 14.sp,
        fontWeight:
            isSelected || isTodayDate ? FontWeight.bold : FontWeight.normal,
        color: isSelected
            ? Colors.white
            : isInCurrentMonth
                ? Colors.black
                : Colors.grey,
      ),
    );
  }
}
