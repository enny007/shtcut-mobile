import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_model.dart';
import 'package:stacked/stacked.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';

class BottomNavLayout extends StackedView<BottomNavLayoutModel> {
  final Widget child;
  const BottomNavLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, BottomNavLayoutModel viewModel, Widget? child) {
    return Scaffold(
      body: this.child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color(0xffFAFAFA),
          border: Border(
            top: BorderSide(
              color: const Color(0xffE3E3E3),
              width: 1.w,
            ),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: viewModel.currentIndex,
          onTap: viewModel.setIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: kcPrimaryColor,
          items: [
            _buildNavItem('assets/svgs/shtcut_home.svg', 'Home', 0, viewModel),
            _buildNavItem('assets/svgs/calendar.svg', 'Calendar', 1, viewModel),
            _buildActionButton(viewModel),
            _buildNavItem('assets/svgs/video.svg', 'Video', 2, viewModel),
            _buildNavItem(
                'assets/svgs/Broadcast.svg', 'Broadcast', 3, viewModel),
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildNavItem(
      String svgPath, String label, int index, BottomNavLayoutModel viewModel) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: EdgeInsets.only(
          left: index == 0 && index == 3 ? 43.w : 0,
          top: 18.h,
        ),
        child: Column(
          children: [
            SvgPicture.asset(
              svgPath,
              height: 24.h,
              width: 24.w,
              colorFilter: ColorFilter.mode(
                viewModel.currentIndex == index
                    ? kcPrimaryColor
                    : const Color(0xff5A5555),
                BlendMode.srcIn,
              ),
            ),
            Gap(8.h),
            Container(
              height: 2.h,
              width: 12.w,
              decoration: BoxDecoration(
                color: viewModel.currentIndex == index
                    ? kcPrimaryColor
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ],
        ),
      ),
      label: '',
    );
  }

  BottomNavigationBarItem _buildActionButton(BottomNavLayoutModel viewModel) {
    return BottomNavigationBarItem(
      icon: SizedBox(
        height: 48.h,
        width: 48.w,
        child: FloatingActionButton(
          backgroundColor: kcPrimaryColor,
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
      label: '',
    );
  }

  @override
  BottomNavLayoutModel viewModelBuilder(BuildContext context) =>
      BottomNavLayoutModel();
}
