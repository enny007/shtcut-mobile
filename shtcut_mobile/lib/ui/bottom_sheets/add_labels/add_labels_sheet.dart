import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/add_labels/add_labels_model.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/label_manager/widgets/label_tile.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AddLabelsSheet extends StackedView<AddLabelsModel> {
  const AddLabelsSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(
      BuildContext context, AddLabelsModel viewModel, Widget? child) {
    return SheetWidget(
      height: 380.h,
      icon: SvgPicture.asset(
        'assets/svgs/sheet_tag.svg',
      ),
      children: [
        AppTextField(
          controller: viewModel.labelController,
          validator: viewModel.validator,
          hintText: 'Announcements',
          label: 'Add Labels',
        ),
        Gap(20.h),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Select a color',
            style: context.bodySmall!.copyWith(
              color: kcTextHeadingColor,
            ),
          ),
        ),
        Gap(10.h),
        Wrap(
          spacing: 12.w,
          runSpacing: 12.h,
          children: LabelColors.allColors.map((color) {
            final isSelected = viewModel.selectedColor == color;
            return GestureDetector(
              onTap: () => viewModel.selectColor(color),
              child: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: isSelected
                      ? Border.all(color: kcPrimaryColor, width: 2.w)
                      : null,
                  // Add a white border inside the blue border for better visibility
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.white,
                            spreadRadius: 1.r,
                          )
                        ]
                      : null,
                ),
              ),
            );
          }).toList(),
        ),
        Gap(27.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          text: 'Back',
          border: Border.all(
            color: kcPrimaryColor,
            width: 2.w,
          ),
          textColor: kcPrimaryColor,
        ),
        Gap(8.h),
        AppButton(
          callback: () {
            viewModel.showLabelCreatedSheet();
          },
          text: 'Save',
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  AddLabelsModel viewModelBuilder(BuildContext context) {
    return AddLabelsModel();
  }
}
