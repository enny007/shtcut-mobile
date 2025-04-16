import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/manage_library/manage_library_model.dart';
import 'package:shtcut_mobile/ui/global_widgets/selectable_card.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ManageLibrarySheet extends StackedView<ManageLibraryModel> {
  const ManageLibrarySheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, ManageLibraryModel viewModel, Widget? child) {
    return DraggableScrollableSheet(
      initialChildSize: 0.55.h,
      maxChildSize: 0.8.h,
      minChildSize: 0.5.h,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
            vertical: 10.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.r),
              topRight: Radius.circular(16.r),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () => completer!(SheetResponse(confirmed: true)),
                  child: const Icon(
                    Icons.close,
                    color: Color(0xff433E3F),
                  ),
                ),
              ),
              Gap(8.h),
              Text(
                'Manage your library',
                style: context.displaySmall!.copyWith(
                  fontSize: 18.sp,
                  color: const Color(0xff101828),
                ),
              ),
              Gap(4.h),
              Text(
                'Manage your social accounts with just one clicks, select any actions to grow socials.',
                style: context.bodySmall!.copyWith(
                  color: const Color(0xff726C6C),
                ),
              ),
              Gap(19.h),
              SelectableCard(
                leadingImage: SvgPicture.asset(
                  'assets/svgs/folder-add.svg',
                  colorFilter: const ColorFilter.mode(
                    Color(0xff433E3F),
                    BlendMode.srcIn,
                  ),
                ),
                title: 'Upload Images & Videos',
                subtitle: 'Post to your social platforms',
                onTap: () {
                  viewModel.showUploadSheet();
                },
              ),
              Gap(6.h),
              SelectableCard(
                leadingImage: SvgPicture.asset('assets/svgs/unsplash.svg'),
                title: 'Upload from Unsplash',
                subtitle: 'Post to your social platforms',
                onTap: () {
                  viewModel.navigateToUnsplash();
                },
              ),
              Gap(19.h),
              Text(
                'Create new',
                style: context.bodySmall!.copyWith(
                  color: const Color(0xff151314),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gap(16.h),
              SelectableCard(
                leadingImage: SvgPicture.asset('assets/svgs/subtitle.svg'),
                title: 'Create New Post',
                subtitle: 'Create a post with media files',
                onTap: () {},
              ),
              Gap(19.h),
              SelectableCard(
                leadingImage: SvgPicture.asset('assets/svgs/folder-open.svg'),
                title: 'Create New Folder',
                subtitle: 'Manage your library',
                onTap: () {
                  viewModel.showCreateFolderSheet();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  ManageLibraryModel viewModelBuilder(BuildContext context) {
    return ManageLibraryModel();
  }
}
