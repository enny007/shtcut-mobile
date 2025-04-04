import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/label_manager/label_manager_model.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/label_manager/widgets/label_tile.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_text_field.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LabelManagerSheet extends StackedView<LabelManagerModel> {
  const LabelManagerSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  @override
  Widget builder(
      BuildContext context, LabelManagerModel viewModel, Widget? child) {
    return SheetWidget(
      height: 470.h,
      icon: SvgPicture.asset(
        'assets/svgs/sheet_tag.svg',
      ),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                'Labels Manager',
                style: context.bodyLarge!.copyWith(
                  color: kcPrimaryTextColor,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  viewModel.showAddLabelSheet();
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Icon(
                      Icons.add_circle_outline,
                      color: kcPrimaryColor,
                      size: 20,
                    ),
                    Text(
                      ' Add Labels',
                      style: context.bodySmall!.copyWith(
                        color: kcPrimaryColor,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Gap(10.h),
        AppTextField(
          controller: viewModel.labelController,
          validator: viewModel.validator,
          prefixWidget: SvgPicture.asset(
            'assets/svgs/label_search.svg',
          ),
          hintText: 'Search label',
        ),
        Gap(20.h),
        LabelTile(
          title: "Food",
          labelColor: LabelColors.redLabel,
          isSelected: true,
          onChanged: (value) {},
        ),
        Gap(6.h),
        const Divider(
          color: Color(0xffE3E3E3),
          height: 0,
        ),
        Gap(6.h),
        LabelTile(
          title: "Brand",
          labelColor: LabelColors.yellowLabel,
          isSelected: false,
          onChanged: (value) {},
        ),
        Gap(6.h),
        const Divider(
          color: Color(0xffE3E3E3),
          height: 0,
        ),
        Gap(6.h),
        LabelTile(
          title: "Fashion",
          labelColor: LabelColors.purpleLabel,
          isSelected: false,
          onChanged: (value) {},
        ),
        Gap(28.h),
        AppButton(
          callback: () {
            completer!(SheetResponse(confirmed: true));
          },
          text: 'Cancel',
          border: Border.all(
            color: kcPrimaryColor,
            width: 2.w,
          ),
          textColor: kcPrimaryColor,
          color: Colors.transparent,
        ),
        Gap(8.h),
        AppButton(
          callback: () {
            // viewModel.showAddLabelSheet();
          },
          text: 'Done',
          color: kcPrimaryColor,
        ),
      ],
    );
  }

  @override
  LabelManagerModel viewModelBuilder(BuildContext context) {
    return LabelManagerModel();
  }
}
