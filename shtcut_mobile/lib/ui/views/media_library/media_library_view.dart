import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/media_library/media_library_view_model.dart';
import 'package:shtcut_mobile/ui/views/media_library/widgets/media_card.dart';
import 'package:shtcut_mobile/ui/views/media_library/widgets/tab_rack.dart';
import 'package:stacked/stacked.dart';

class MediaLibraryView extends StackedView<MediaLibraryViewModel> {
  const MediaLibraryView({super.key});

  @override
  Widget builder(
      BuildContext context, MediaLibraryViewModel viewModel, Widget? child) {
    final data = MediaQueryData.fromView(View.of(context));
    final isTablet = data.size.shortestSide >= 600;
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        body: Stack(
          children: [
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
                        'Media Library',
                        style: context.displayLarge!.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Gap(3.h),
                      Text(
                        'Manage all media assets',
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xffD9D6FE),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    'assets/svgs/media.svg',
                    fit: BoxFit.scaleDown,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 150.h,
              ),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
                margin: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffFEFEFE),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: AppTextField(
                            controller: viewModel.mediaContentController,
                            validator: (_) {
                              return null;
                            },
                            hintText: 'Search',
                            prefixIcon: SvgPicture.asset(
                              'assets/svgs/search.svg',
                              fit: BoxFit.scaleDown,
                            ),
                          ),
                        ),
                        Gap(10.w),
                        GestureDetector(
                          onTap: () {
                            viewModel.showManageLibrarySheet();
                          },
                          child: Container(
                            // width: 79.w,
                            height: 46.h,
                            padding: EdgeInsets.symmetric(
                              vertical: 10.h,
                              horizontal: 14.w,
                            ),
                            decoration: BoxDecoration(
                              color: kcPrimaryColor,
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            alignment: Alignment.center,
                            child: Text(
                              'Manage',
                              style: context.bodySmall!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(10.h),
                    TabRack(
                      currentIndex: viewModel.currentTabIndex,
                      onTabChanged: viewModel.setTabIndex,
                    ),
                    Gap(21.h),
                    Expanded(
                      child: viewModel.currentTabItems.isEmpty
                          ? Center(
                              child: Text(
                                'No items to display',
                                style: context.bodyLarge,
                              ),
                            )
                          : GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.w,
                                mainAxisSpacing: 16.h,
                                childAspectRatio: isTablet ? 1.8.dg : 0.8.dg,
                              ),
                              itemCount: viewModel.currentTabItems.length,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, index) {
                                final item = viewModel.currentTabItems[index];
                                return MediaCard(
                                  name: item['name'],
                                  date: item['date'],
                                  type: item['type'],
                                  thumbnailUrl: item['thumbnailUrl'],
                                  fileFormat: item['fileFormat'],
                                  isSelected: viewModel.isItemSelected(index),
                                  onSelect: () =>
                                      viewModel.toggleItemSelection(index),
                                  onTap: () {
                                    // Handle tap on media item
                                    // For example, open a detail view
                                  },
                                );
                              },
                            ),
                    ),
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
  MediaLibraryViewModel viewModelBuilder(BuildContext context) {
    return MediaLibraryViewModel();
  }
}
