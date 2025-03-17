import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/bottom_navigation/bottom_nav_layout.dart';
import 'package:shtcut_mobile/ui/views/create_post/create_post_view_model.dart';
import 'package:shtcut_mobile/ui/views/create_post/widgets/content_option_tile.dart';
import 'package:shtcut_mobile/ui/views/create_post/widgets/media_preview_row.dart';
import 'package:stacked/stacked.dart';

class CreatePostContentView extends StackedView<CreatePostViewModel> {
  const CreatePostContentView({super.key});

  @override
  Widget builder(
      BuildContext context, CreatePostViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 728.h,
              child: Stack(
                children: [
                  Container(
                    height: 233.h,
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      top: 45.h,
                    ),
                    decoration: BoxDecoration(
                      color: kcPrimaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(24.r),
                        bottomRight: Radius.circular(24.r),
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: IconButton(
                        icon: Platform.isIOS
                            ? const Icon(Icons.arrow_back_ios,
                                color: Colors.white)
                            : const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => navRouter.back(),
                      ),
                      title: Text(
                        'Create New Post',
                        style: context.displayMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xffFEFEFE),
                        ),
                      ),
                      subtitle: Text(
                        'Post to your social platforms ',
                        style: context.bodyMedium!.copyWith(
                          color: const Color(0xffD9D6FE),
                        ),
                      ),
                      trailing: SvgPicture.asset(
                        'assets/svgs/placard_icon.svg',
                        height: 80.h,
                        width: 87.w,
                        // fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 133.h,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 12.h,
                      ),
                      margin: EdgeInsets.symmetric(
                        horizontal: 12.w,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffFEFEFE),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Post Content',
                              style: context.bodyMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xff101828),
                              ),
                            ),
                            Gap(2.h),
                            Text(
                              'Add captions to your post',
                              style: context.bodySmall!.copyWith(
                                color: const Color(0xff475467),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Gap(21.h),
                            AppTextField(
                              controller: viewModel.contentController,
                              validator: viewModel.contentValidator,
                              maxLines: 7,
                              hintText: 'Add Caption',
                            ),
                            Gap(14.h),
                            if (viewModel.selectedMedia.isNotEmpty)
                              MediaPreviewRow(
                                mediaItems: viewModel.selectedMedia,
                                onRemove: (index) =>
                                    viewModel.removeMedia(index),
                              ),
                            Gap(viewModel.selectedMedia.isNotEmpty ? 14.h : 0),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: viewModel.contentOptions.length,
                              itemBuilder: (context, index) {
                                final option = viewModel.contentOptions[index];
                                return ContentOptionTile(
                                  svgPath: option['svgPath'],
                                  title: option['title'],
                                  onTap: () {
                                    option['onTap']();
                                  },
                                );
                              },
                            ),
                            Gap(50.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.w,
                      ),
                      child: AppButton(
                        callback: () {},
                        text: 'Next',
                        color: kcPrimaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  CreatePostViewModel viewModelBuilder(BuildContext context) =>
      CreatePostViewModel();
}
