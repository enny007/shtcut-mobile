import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/hashtag/hashtag_model.dart';
import 'package:shtcut_mobile/ui/bottom_sheets/hashtag/widgets/hashtag_tile.dart';
import 'package:shtcut_mobile/ui/common/app_colors.dart';
import 'package:shtcut_mobile/ui/global_widgets/app_button.dart';
import 'package:shtcut_mobile/ui/global_widgets/sheet_widget.dart';
import 'package:shtcut_mobile/ui/utils/extensions.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HashtagSheet extends StackedView<HashtagModel> {
  const HashtagSheet({
    super.key,
    this.completer,
    required this.request,
  });
  final Function(SheetResponse)? completer;
  final SheetRequest request;

  @override
  Widget builder(BuildContext context, HashtagModel viewModel, Widget? child) {
    return SheetWidget(
      height: 450.h,
      icon: SvgPicture.asset('assets/svgs/hashtag_sheet.svg'),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Text(
                'Hashtag Manager',
                style: context.bodyLarge!.copyWith(
                  color: kcPrimaryTextColor,
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  viewModel.showAddHashtagSheet();
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
                      ' Add Hashtag',
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
        Gap(30.h),
        HashtagTile(
          title: 'Food',
          hashtag: '#Pizza #Kitchen #Catering',
          isSelected: true,
          onChanged: (value) {
            // Handle checkbox state change
            print('Hashtag selected: $value');
          },
        ),
        Gap(3.h),
        const Divider(
          color: Color(0xffE3E3E3),
          height: 0,
        ),
        HashtagTile(
          title: 'Brands',
          hashtag: '#Branding #marketing #growth',
          isSelected: true,
          onChanged: (value) {
            // Handle checkbox state change
            print('Hashtag selected: $value');
          },
        ),
        Gap(3.h),
        const Divider(
          color: Color(0xffE3E3E3),
          height: 0,
        ),
        HashtagTile(
          title: 'Fashion',
          hashtag: '#Clothes #Shoes #Bags',
          isSelected: true,
          onChanged: (value) {
            // Handle checkbox state change
            print('Hashtag selected: $value');
          },
        ),
        Gap(34.h),
        AppButton(
          callback: () {
            viewModel.showAddHashtagSheet();
          },
          text: 'Done',
          color: kcPrimaryColor,
        ),
        Gap(8.h),
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
        ),
      ],
    );
  }

  @override
  HashtagModel viewModelBuilder(BuildContext context) {
    return HashtagModel(
      completer: completer,
    );
  }
}
