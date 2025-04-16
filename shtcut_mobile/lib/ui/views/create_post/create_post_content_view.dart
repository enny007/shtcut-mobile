import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
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
  const CreatePostContentView({
    super.key,
    this.isEditView = false,
  });
  final bool isEditView;
  @override
  Widget builder(
      BuildContext context, CreatePostViewModel viewModel, Widget? child) {
    return BottomNavLayout(
      child: Scaffold(
        backgroundColor: const Color(0xffF1F3F8),
        appBar: AppBar(
          backgroundColor: const Color(0xffFEFEFE),
          toolbarHeight: 60.h,
          elevation: 0,
          leadingWidth: 71.w,
          leading: Row(
            children: [
              Gap(10.w),
              GestureDetector(
                onTap: () => navRouter.back(),
                child: Container(
                  height: 32.h,
                  width: 32.w,
                  decoration: const BoxDecoration(
                    color: Color(0xffDCE5FB),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Platform.isIOS
                        ? Padding(
                            padding: EdgeInsets.only(left: 2.w),
                            child: const Icon(
                              Icons.arrow_back_ios,
                              color: kcPrimaryColor,
                              size: 18.29,
                            ),
                          )
                        : const Icon(
                            Icons.arrow_back,
                            color: kcPrimaryColor,
                            size: 18.29,
                          ),
                  ),
                ),
              ),
            ],
          ),
          centerTitle: true,
          title: Text(
            isEditView == true ? 'Edit Post' : 'Create New Posts',
            style: context.displaySmall!.copyWith(
              color: const Color(0xff101828),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsetsExtension.fromPercentage(
              lefthorizontalPercentage: 12.w,
              righthorizontalPercentage: 12.w,
              topverticalPercentage: 20.h,
              bottomverticalPercentage: 20.h,
              context: context,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
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
                        onRemove: (index) => viewModel.removeMedia(index),
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
                    // Add padding at the bottom to ensure content is scrollable
                    Gap(30.h),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
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
              viewModel.navigateToPreview();
            },
            text: 'Next',
            color: kcPrimaryColor,
          ),
        ),
      ),
    );
  }

  @override
  CreatePostViewModel viewModelBuilder(BuildContext context) =>
      CreatePostViewModel();
}
