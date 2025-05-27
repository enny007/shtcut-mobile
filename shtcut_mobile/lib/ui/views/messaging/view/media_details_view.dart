import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart'
    hide EdgeInsetsExtension;
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/app/app_setup.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:shtcut_mobile/ui/views/messaging/view_model/media_details_view_model.dart';
import 'package:stacked/stacked.dart';

class MediaDetailsView extends StackedView<MediaDetailsViewModel> {
  const MediaDetailsView({super.key});

  @override
  Widget builder(
      BuildContext context, MediaDetailsViewModel viewModel, Widget? child) {
    return Scaffold(
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
          'Media',
          style: context.displaySmall!.copyWith(
            color: const Color(0xff101828),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsetsExtension.fromPercentage(
          lefthorizontalPercentage: 23.w,
          righthorizontalPercentage: 23.w,
          topverticalPercentage: 20.h,
          bottomverticalPercentage: 20.h,
          context: context,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.r),
              ),
              child: Row(
                children: [
                  _buildSegmentButton(
                    context,
                    'Media',
                    MediaViewType.media,
                    viewModel,
                  ),
                  _buildSegmentButton(
                    context,
                    'Docs',
                    MediaViewType.docs,
                    viewModel,
                  ),
                  _buildSegmentButton(
                    context,
                    'Links',
                    MediaViewType.links,
                    viewModel,
                  ),
                ],
              ),
            ),
            Gap(14.h),
            Expanded(
              child: _buildSelectedView(viewModel),
            ),
          ],
        ),
      ),
    );
  }

  @override
  MediaDetailsViewModel viewModelBuilder(BuildContext context) {
    return MediaDetailsViewModel();
  }

  Widget _buildSegmentButton(
    BuildContext context,
    String title,
    MediaViewType viewType,
    MediaDetailsViewModel viewModel,
  ) {
    final isSelected = viewModel.mediaViewType == viewType;

    return Expanded(
      child: GestureDetector(
        onTap: () => viewModel.setMediaViewType(viewType),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isSelected ? kcPrimaryColor : Colors.transparent,
            borderRadius: BorderRadius.circular(100.r),
          ),
          child: Center(
            child: Text(
              title,
              style: context.bodySmall!.copyWith(
                color: isSelected ? Colors.white : Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedView(MediaDetailsViewModel viewModel) {
    switch (viewModel.mediaViewType) {
      case MediaViewType.media:
        return _buildMediaView();
      case MediaViewType.docs:
        return _buildDocsView();
      case MediaViewType.links:
        return _buildLinksView();
    }
  }

  Widget _buildMediaView() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: GridView.builder(
        padding: EdgeInsets.all(16.w),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 8.h,
        ),
        itemCount: 15, // Replace with actual media count
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: const Icon(Icons.image, color: Colors.grey),
          );
        },
      ),
    );
  }

  Widget _buildDocsView() {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: 10, // Replace with actual docs count
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.insert_drive_file, color: kcPrimaryColor),
          title: Text('Document ${index + 1}'),
          subtitle: const Text('PDF • 2.5 MB'),
          trailing: const Icon(Icons.download_outlined),
        );
      },
    );
  }

  Widget _buildLinksView() {
    return ListView.separated(
      padding: EdgeInsets.all(16.w),
      itemCount: 8, // Replace with actual links count
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.link, color: kcPrimaryColor),
          title: Text('Link ${index + 1}'),
          subtitle: Text('https://example.com/link${index + 1}'),
          trailing: const Icon(Icons.open_in_new),
        );
      },
    );
  }
}
