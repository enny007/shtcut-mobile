import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/calendar/calendar_view_model.dart';
import 'package:shtcut_mobile/ui/views/calendar/widget/calendar_tile.dart';
import 'package:shtcut_mobile/ui/views/calendar/widget/simple_calendar.dart';
import 'package:stacked/stacked.dart';

class CalendarView extends StackedView<CalendarViewModel> {
  const CalendarView({super.key});

  @override
  Widget builder(
      BuildContext context, CalendarViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        body: Stack(
          children: [
            // Static blue header container
            Container(
              width: double.infinity,
              height: 233.h,
              padding: EdgeInsets.only(
                left: 18.w,
                right: 18.w,
                top: 10.h,
                bottom: 30.h,
              ),
              decoration: BoxDecoration(
                color: kcPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24.r),
                  bottomRight: Radius.circular(24.r),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Calendar',
                        style: context.displayLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Gap(3.h),
                      Text(
                        'Post to your social platforms ',
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xffD9D6FE),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/svgs/calendar_svg.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ),

            // Scrollable content (calendar and posts)
            Padding(
              padding: EdgeInsets.only(
                  top: 150.h), // Adjust to position below header
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Calendar card
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: viewModel.toggleCalendarView,
                              child: SvgPicture.asset(
                                viewModel.isCalendarExpanded
                                    ? 'assets/svgs/maximize.svg'
                                    : 'assets/svgs/minimize.svg',
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          viewModel.isCalendarExpanded
                              ? SimpleCalendar(
                                  days: viewModel.getDaysInMonth(),
                                  displayedMonth: viewModel.displayedMonth,
                                  onSelectDate: (date) {
                                    viewModel.selectDate(date);
                                  },
                                  isCurrentMonth: viewModel.isCurrentMonth,
                                  isSelectedDate: viewModel.isSelectedDate,
                                  isToday: viewModel.isToday,
                                  onNextMonth: viewModel.nextMonth,
                                  onPreviousMonth: viewModel.previousMonth,
                                  dayBuilder: (context, date, isSelectable) {
                                    bool hasEvent = viewModel.hasPosts(date);

                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        // The date number
                                        Text(
                                          date.day.toString(),
                                          style: TextStyle(
                                            color: !isSelectable
                                                ? Colors.grey
                                                    .withValues(alpha: .5)
                                                : viewModel.isSelectedDate(date)
                                                    ? Colors.white
                                                    : viewModel.isToday(date)
                                                        ? kcPrimaryColor
                                                        : Colors.black,
                                          ),
                                        ),

                                        // Event indicator (dot) beside the date
                                        if (hasEvent && isSelectable)
                                          Container(
                                            margin: EdgeInsets.only(left: 2.w),
                                            width: 5.w,
                                            height: 5.h,
                                            decoration: BoxDecoration(
                                              color:
                                                  viewModel.isSelectedDate(date)
                                                      ? Colors.white
                                                      : kcPrimaryColor,
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                      ],
                                    );
                                  },
                                )
                              : _buildCollapsedCalendar(context, viewModel),
                        ],
                      ),
                    ),

                    Gap(20.h),

                    // Today Posts container
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 17.w,
                          vertical: 20.h,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Today Posts',
                                  style: context.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                // Add date indicator
                                Text(
                                  _formatDate(viewModel.selectedDate),
                                  style: context.bodySmall!.copyWith(
                                    color: kcPrimaryColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Gap(20.h),
                            // Posts list
                            _buildPostsList(context, viewModel),
                          ],
                        ),
                      ),
                    ),

                    // Add bottom padding
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CalendarViewModel viewModelBuilder(BuildContext context) {
    return CalendarViewModel();
  }

  // Format date as "Month Day, Year"
  String _formatDate(DateTime date) {
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
    return '${monthNames[date.month - 1]} ${date.day}, ${date.year}';
  }

  // Build the list of posts for the selected date
  Widget _buildPostsList(BuildContext context, CalendarViewModel viewModel) {
    final posts = viewModel.getPostsForDate(viewModel.selectedDate);

    // Determine how many posts to show based on calendar state
    // Show more posts when calendar is collapsed
    final displayCount = viewModel.isCalendarExpanded
        ? posts.isEmpty
            ? 0
            : min(posts.length, 2) // Show max 2 posts when expanded
        : posts.length; // Show all posts when collapsed

    if (posts.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_outlined,
              size: 48.sp,
              color: Colors.grey[400],
            ),
            Gap(16.h),
            Text(
              'No posts scheduled for this date',
              style: context.bodyLarge!.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    // Calculate max height for the posts list based on calendar state
    final maxHeight = viewModel.isCalendarExpanded
        ? 200.h // Limited height when calendar is expanded
        : 400.h; // More space when calendar is collapsed

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
            maxHeight: posts.length > 3 ? maxHeight : double.infinity,
          ),
          child: ListView.separated(
            itemCount: displayCount,
            padding: EdgeInsets.zero,
            shrinkWrap: posts.length <= 3, // Only shrink if few items
            physics: posts.length > 3
                ? const AlwaysScrollableScrollPhysics() // Scrollable if many items
                : const NeverScrollableScrollPhysics(), // Not scrollable if few items
            separatorBuilder: (context, index) => Gap(12.h),
            itemBuilder: (context, index) {
              return CalendarTile(
                onTap: () {
                  viewModel.navigateToPostReview();
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // Month dropdown widget for collapsed view
  Widget _buildMonthDropdown(
      BuildContext context, CalendarViewModel viewModel) {
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

    return PopupMenuButton<int>(
      initialValue: viewModel.displayedMonth.month,
      onSelected: (value) {
        viewModel.changeMonth(value);
      },
      offset: const Offset(0, 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.r),
      ),
      itemBuilder: (context) => List.generate(12, (index) {
        return PopupMenuItem<int>(
          value: index + 1,
          child: Text(
            monthNames[index],
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${monthNames[viewModel.displayedMonth.month - 1]}, ${viewModel.displayedMonth.year}',
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(
            Icons.keyboard_arrow_down,
            size: 30,
            color: kcPrimaryColor,
          ),
        ],
      ),
    );
  }

  // Collapsed calendar view (week view)
  Widget _buildCollapsedCalendar(
      BuildContext context, CalendarViewModel viewModel) {
    final weekDays = viewModel.getCurrentWeekDays();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildMonthDropdown(context, viewModel),
        Gap(12.h),
        // Week view
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: weekDays.map((date) {
            final isSelected = viewModel.isSelectedDate(date);
            final isToday = viewModel.isToday(date);
            final hasEvent = viewModel.hasPosts(date);

            // Day of week abbreviations
            final dayNames = [
              'Sun',
              'Mon',
              'Tue',
              'Wed',
              'Thu',
              'Fri',
              'Sat',
            ];

            return GestureDetector(
              onTap: () => viewModel.selectDate(date),
              child: Container(
                width: 40.w,
                height: 60.h,
                decoration: BoxDecoration(
                  color: isSelected ? kcPrimaryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(8.r),
                  border: isToday && !isSelected
                      ? Border.all(color: kcPrimaryColor, width: 1.w)
                      : null,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Date number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          date.day.toString(),
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: isSelected
                                ? Colors.white
                                : isToday
                                    ? kcPrimaryColor
                                    : Colors.black,
                          ),
                        ),

                        // Event indicator
                        if (hasEvent)
                          Container(
                            margin: EdgeInsets.only(left: 2.w),
                            width: 5.w,
                            height: 5.h,
                            decoration: BoxDecoration(
                              color: isSelected ? Colors.white : kcPrimaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                      ],
                    ),

                    Gap(4.h),

                    // Day name (abbreviated)
                    Text(
                      dayNames[date.weekday % 7],
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: isSelected ? Colors.white : Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
