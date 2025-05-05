import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/unsplash/unsplash_view_model.dart';
import 'package:shtcut_mobile/ui/views/unsplash/widgets/category_card.dart';
import 'package:shtcut_mobile/ui/views/unsplash/widgets/selectable_image_cards.dart';
import 'package:stacked/stacked.dart';

class UnsplashView extends StackedView<UnsplashViewModel> {
  const UnsplashView({super.key});

  @override
  Widget builder(
      BuildContext context, UnsplashViewModel viewModel, Widget? child) {
    final data = MediaQueryData.fromView(View.of(context));
    final isTablet = data.size.shortestSide >= 600;
    return Scaffold(
      backgroundColor: const Color(0xffF1F3F8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: 120.w,
        leading: Row(
          children: [
            Gap(18.w),
            SvgPicture.asset(
              'assets/svgs/unsplash_image.svg',
              fit: BoxFit.scaleDown,
            ),
            Gap(10.w),
            Flexible(
              child: Text(
                'Unsplash',
                style: context.bodySmall!.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
        // centerTitle: false,
        actions: [
          Text(
            '${viewModel.selectedImagesCount} Selected',
            style: context.bodySmall!.copyWith(
              color: Colors.black,
            ),
          ),
          Gap(12.w),
          GestureDetector(
            onTap: () {
              navRouter.back();
            },
            child: Container(
              height: 26.h,
              // width: 71.w,
              margin: EdgeInsets.only(
                right: 20.w,
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 11.46.w,
                vertical: 2.h,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.r),
                color: kcPrimaryColor,
                border: Border.all(
                  color: const Color(0xff7F56D9),
                  width: 0.64.w,
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xff101828).withValues(alpha: 0.05),
                    blurRadius: 1.27,
                    offset: const Offset(0, 0.64),
                    spreadRadius: 0,
                  )
                ],
              ),
              alignment: Alignment.center,
              child: Text(
                'Done',
                style: context.bodySmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 16.w,
          righthorizontalPercentage: 16.w,
          topverticalPercentage: 0.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextField(
              controller: viewModel.unsplashController,
              validator: (_) {
                return null;
              },
              hintText: 'Search',
              prefixIcon: SvgPicture.asset(
                'assets/svgs/unsplash_search.svg',
                fit: BoxFit.scaleDown,
              ),
            ),
            Gap(33.h),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Browse by category',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Gap(20.h),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 9.w,
                        mainAxisSpacing: 10.h,
                        childAspectRatio: 1.1,
                      ),
                      itemCount: viewModel.categories.length,
                      itemBuilder: (context, index) {
                        final category = viewModel.categories[index];
                        return CategoryCard(
                          name: category['name'] ?? '',
                          imageUrl: category['image'] ?? '',
                          onTap: () {},
                        );
                      },
                    ),
                    Gap(15.h),
                    Text(
                      'Discover',
                      style: context.bodySmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    Gap(20.h),
                    GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16.w,
                        mainAxisSpacing: 16.h,
                        childAspectRatio: 176 / 190, // Width / Height ratio
                      ),
                      itemCount: viewModel.discoverImages.length,
                      itemBuilder: (context, index) {
                        final image = viewModel.discoverImages[index];
                        return SelectableImageCard(
                          id: image['id'],
                          imageUrl: image['image'],
                          isSelected: image['isSelected'],
                          onTap: () => viewModel.toggleImageSelection(
                            image['id'],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  UnsplashViewModel viewModelBuilder(BuildContext context) {
    return UnsplashViewModel();
  }
}
