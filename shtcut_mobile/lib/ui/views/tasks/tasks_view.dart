import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/tasks/tasks_view_model.dart';
import 'package:shtcut_mobile/ui/views/tasks/widgets/task_card.dart';
import 'package:shtcut_mobile/ui/views/tasks/widgets/task_tile.dart';
import 'package:stacked/stacked.dart';

class TasksView extends StackedView<TasksViewModel> {
  const TasksView({super.key});

  @override
  Widget builder(
      BuildContext context, TasksViewModel viewModel, Widget? child) {
    final data = MediaQueryData.fromView(View.of(context));
    final isTablet = data.size.shortestSide >= 600;
    return BottomNavLayout(
      child: DefaultTabController(
        length: 3,
        initialIndex: viewModel.selectedTabIndex,
        child: Scaffold(
          backgroundColor: const Color(0xffF1F3F8),
          body: Column(
            children: [
              Stack(
                children: [
                  // Header section with purple background
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
                              'Tasks',
                              style: context.displayLarge!.copyWith(
                                fontSize: 24.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Text(
                              'Let\'s tackle your to do list',
                              style: context.bodyMedium!.copyWith(
                                color: const Color(0xffD9D6FE),
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/svgs/clipboard.svg',
                          fit: BoxFit.scaleDown,
                        ),
                      ],
                    ),
                  ),

                  // Summary card
                  Padding(
                    padding: EdgeInsets.only(
                      top: 150.h,
                    ),
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 12.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFEFEFE),
                        borderRadius: BorderRadius.circular(8.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: .05),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Summary of Your work',
                            style: context.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff101828),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          Text(
                            'Your current task progress',
                            style: context.bodySmall!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: kcSecondaryColor,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: TaskTile(
                                  assetName: 'assets/svgs/to_do.svg',
                                  taskState: 'ToDo',
                                  taskNumber:
                                      '${viewModel.allTasksCount - viewModel.inProgressCount - viewModel.doneCount}',
                                ),
                              ),
                              Gap(8.h),
                              Expanded(
                                child: TaskTile(
                                  assetName: 'assets/svgs/in_progress.svg',
                                  taskState: 'In Progress',
                                  taskNumber: '${viewModel.inProgressCount}',
                                  isLongerThan9: true,
                                ),
                              ),
                              Gap(8.h),
                              Expanded(
                                child: TaskTile(
                                  assetName: 'assets/svgs/done.svg',
                                  taskState: 'Done',
                                  taskNumber: '${viewModel.doneCount}',
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(23.h),
              // Tab bar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.w),
                padding: EdgeInsets.symmetric(
                  vertical: 8.h,
                  horizontal: 8.w,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildTabItem(
                      context,
                      'All',
                      viewModel.allTasksCount.toString(),
                      0,
                      viewModel.selectedTabIndex,
                      () => viewModel.setSelectedTabIndex(0),
                    ),
                    _buildTabItem(
                      context,
                      'In Progress',
                      viewModel.inProgressCount.toString(),
                      1,
                      viewModel.selectedTabIndex,
                      () => viewModel.setSelectedTabIndex(1),
                    ),
                    _buildTabItem(
                      context,
                      'Done',
                      viewModel.doneCount.toString(),
                      2,
                      viewModel.selectedTabIndex,
                      () => viewModel.setSelectedTabIndex(2),
                    ),
                  ],
                ),
              ),
              Gap(16.h),
              // Task content
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: viewModel.filteredTasks.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/svgs/empty_tasks.svg',
                              height: 100.h,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'No tasks found',
                              style: context.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              'You don\'t have any tasks in this category yet',
                              style: context.bodyMedium!.copyWith(
                                color: kcSecondaryColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                    : SizedBox(
                        height: isTablet ? 550.h : 240.h,
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: viewModel.filteredTasks.length,
                          itemBuilder: (context, index) {
                            final task = viewModel.filteredTasks[index];
                            return TaskCard(
                              title: task['title'],
                              status: task['status'],
                              priority: task['priority'],
                              progress: task['progress'],
                              dueDate: task['dueDate'],
                              comments: task['comments'],
                              statusColor: task['statusColor'],
                              priorityColor: task['priorityColor'],
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 15.h,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .05),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, -1),
                ),
              ],
            ),
            child: AppButton(
              callback: () {
                viewModel.navigateToTaskDetailView();
              },
              text: 'Create Task',
              color: kcPrimaryColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(
    BuildContext context,
    String title,
    String count,
    int index,
    int selectedIndex,
    VoidCallback onTap,
  ) {
    final isSelected = index == selectedIndex;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? kcPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(100.r),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: context.bodyMedium!.copyWith(
                color: isSelected ? Colors.white : kcSecondaryColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
            Gap(4.w),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 6.w,
                vertical: 2.h,
              ),
              decoration: BoxDecoration(
                color: isSelected
                    ? Colors.white.withOpacity(0.2)
                    : kcPrimaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Text(
                count,
                style: context.bodySmall!.copyWith(
                  color: isSelected ? Colors.white : kcPrimaryColor,
                  fontSize: 10.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  TasksViewModel viewModelBuilder(BuildContext context) {
    return TasksViewModel();
  }
}
