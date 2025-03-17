import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/add_hashtag/add_hashtag_model.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddHashtagSheet extends StackedView<AddHashtagModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const AddHashtagSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
      BuildContext context, AddHashtagModel viewModel, Widget? child) {
    return SheetWidget(
      height: 470.h,
      icon: SvgPicture.asset('assets/svgs/hashtag_sheet.svg'),
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Add Hashtag',
            style: context.bodyLarge!.copyWith(
              color: kcPrimaryTextColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Gap(16.h),
        AppTextField(
          controller: viewModel.hashtagNamecontroller,
          validator: viewModel.titlevalidator,
          hintText: 'Enter hashtag name',
        ),
        Gap(14.h),
        AppTextField(
          controller: viewModel.hashtagValuecontroller,
          validator: viewModel.validator,
          maxLines: 4,
          hintText: 'Enter tags associated e.g #branding',
        ),
        Gap(26.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          text: 'Back',
          textColor: kcPrimaryColor,
          border: Border.all(
            color: kcPrimaryColor,
            width: 2.w,
          ),
        ),
        Gap(8.h),
        AppButton(
          callback: () {
            viewModel.showHashtagCreatedSheet();
          },
          text: 'Save',
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  AddHashtagModel viewModelBuilder(BuildContext context) {
    return AddHashtagModel(
      completer: completer,
    );
  }
}
