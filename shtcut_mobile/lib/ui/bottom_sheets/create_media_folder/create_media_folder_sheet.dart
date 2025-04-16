import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/create_media_folder/create_media_folder_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreateMediaFolderSheet extends StackedView<CreateMediaFolderModel> {
  const CreateMediaFolderSheet({
    super.key,
    required this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, CreateMediaFolderModel viewModel, Widget? child) {
    return Container(
      height: 320.h,
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
            'Create New Folder',
            style: context.displaySmall!.copyWith(
              fontSize: 18.sp,
              color: const Color(0xff101828),
            ),
          ),
          Gap(17.h),
          AppTextField(
            controller: viewModel.folderNameController,
            validator: (_) {
              return null;
            },
            hintText: 'Enter Folder name',
          ),
          Gap(28.h),
          AppButton(
            callback: () {},
            text: 'Create Folder',
            color: kcPrimaryColor,
          ),
          Gap(8.h),
          AppButton(
            callback: () {
              completer!(SheetResponse(confirmed: true));
            },
            text: 'Cancel',
            textColor: kcPrimaryColor,
            border: Border.all(
              color: kcPrimaryColor,
              width: 2.w,
            ),
            color: Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  CreateMediaFolderModel viewModelBuilder(BuildContext context) {
    return CreateMediaFolderModel();
  }
}
